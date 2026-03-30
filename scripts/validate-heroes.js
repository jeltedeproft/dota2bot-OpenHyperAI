#!/usr/bin/env node
/**
 * validate-heroes.js
 *
 * Validates all bots/BotLib/hero_*.lua files for common issues:
 *   1. Duplicate items in sRoleItemsBuyList (per-role buy lists)
 *   2. Odd-length sSellList (unpaired entry — last item has no sell partner)
 *
 * NOTE: sSellList uses a PAIRED format:
 *   [buy_item1, sell_item1, buy_item2, sell_item2, ...]
 *   "When I have buy_itemN in my inventory, sell sell_itemN."
 *   The same sell_item validly appears multiple times (one per buy trigger).
 *   We do NOT check for duplicate sell items. We only check the list is even-length.
 *
 * Run locally:  node scripts/validate-heroes.js
 * Run in CI:    automatically via .github/workflows/validate.yml
 */

const fs = require('fs');
const path = require('path');

const HERO_DIR = path.join(__dirname, '../bots/BotLib');
const files = fs
    .readdirSync(HERO_DIR)
    .filter((f) => f.startsWith('hero_') && f.endsWith('.lua'))
    .sort();

let totalErrors = 0;

/**
 * Extract all quoted item_* strings from a block of Lua source,
 * starting at the first '{' found after `startIdx`.
 * Returns { items: string[], endIdx: number }
 */
function extractItemsFromBlock(src, startIdx) {
    const openBrace = src.indexOf('{', startIdx);
    if (openBrace === -1) return { items: [], endIdx: startIdx };

    let depth = 0;
    let i = openBrace;
    while (i < src.length) {
        if (src[i] === '{') depth++;
        else if (src[i] === '}') {
            depth--;
            if (depth === 0) break;
        }
        i++;
    }
    const block = src.slice(openBrace, i + 1);
    const items = [...block.matchAll(/["'](item_[^"']+)["']/g)].map((m) => m[1]);
    return { items, endIdx: i };
}

/**
 * Check an array of item names for duplicates.
 * Returns a list of duplicate names.
 */
function findDuplicates(items) {
    const seen = new Set();
    const dupes = new Set();
    for (const item of items) {
        if (seen.has(item)) dupes.add(item);
        seen.add(item);
    }
    return [...dupes];
}

for (const file of files) {
    const src = fs.readFileSync(path.join(HERO_DIR, file), 'utf8');
    const errors = [];

    // --- 1. Check sSellList is even-length (paired format) ---
    const sellListIdx = src.search(/X\[['"]sSellList['"]\]\s*=/);
    if (sellListIdx !== -1) {
        const { items } = extractItemsFromBlock(src, sellListIdx);
        if (items.length % 2 !== 0) {
            errors.push(`sSellList: odd number of items (${items.length}) — last entry has no pair`);
        }
    }

    // --- 2. Check each sRoleItemsBuyList['pos_N'] for duplicate items ---
    // Skip alias lines like: sRoleItemsBuyList['pos_1'] = sRoleItemsBuyList['pos_3']
    // These contain no '{' and would otherwise accidentally pick up the next block's brace.
    const buyListPattern = /sRoleItemsBuyList\[['"][^'"]+['"]\]\s*=/g;
    let match;
    while ((match = buyListPattern.exec(src)) !== null) {
        // Find end of this line to check if '{' is present before the newline
        const lineEnd = src.indexOf('\n', match.index);
        const lineContent = src.slice(match.index, lineEnd === -1 ? undefined : lineEnd);
        if (!lineContent.includes('{')) continue; // alias line, not a literal block

        const roleName = (lineContent.match(/\[['"]([^'"]+)['"]\]/) || [])[1];
        const { items } = extractItemsFromBlock(src, match.index);
        const dupes = findDuplicates(items);
        for (const d of dupes) {
            errors.push(`sRoleItemsBuyList['${roleName}']: duplicate item "${d}"`);
        }
    }

    if (errors.length > 0) {
        console.error(`\n${file}:`);
        errors.forEach((e) => console.error(`  ERROR: ${e}`));
        totalErrors += errors.length;
    }
}

if (totalErrors > 0) {
    console.error(`\n${totalErrors} error(s) found across ${files.length} hero files.`);
    process.exit(1);
} else {
    console.log(`OK: ${files.length} hero files validated, no issues found.`);
}
