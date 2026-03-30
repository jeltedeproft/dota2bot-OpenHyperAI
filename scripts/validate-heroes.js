#!/usr/bin/env node
/**
 * validate-heroes.js
 *
 * Validates all bots/BotLib/hero_*.lua files for common issues:
 *   1. Duplicate items in sSellList
 *   2. Duplicate items in sBuyList (per-role)
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

    // Walk to the matching closing brace (handles 1 level of nesting)
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

    // --- 1. Check sSellList for duplicates ---
    const sellListIdx = src.search(/X\[['"]sSellList['"]\]\s*=/);
    if (sellListIdx !== -1) {
        const { items } = extractItemsFromBlock(src, sellListIdx);
        const dupes = findDuplicates(items);
        for (const d of dupes) {
            errors.push(`sSellList: duplicate item "${d}"`);
        }
    }

    // --- 2. Check each sRoleItemsBuyList['pos_N'] for duplicates ---
    const buyListPattern = /sRoleItemsBuyList\[['"][^'"]+['"]\]\s*=/g;
    let match;
    while ((match = buyListPattern.exec(src)) !== null) {
        const roleName = (src.slice(match.index, match.index + 60).match(/\[['"]([^'"]+)['"]\]/) || [])[1];
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
