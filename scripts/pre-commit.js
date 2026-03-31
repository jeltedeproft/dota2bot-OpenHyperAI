#!/usr/bin/env node
/**
 * pre-commit.js
 *
 * Cross-platform pre-commit hook logic (Windows + Mac + Linux).
 * Invoked by .git/hooks/pre-commit via: node scripts/pre-commit.js
 *
 * Checks:
 *   1. TypeScript → Lua: rebuild + re-stage if any .ts source is staged
 *   2. Prettier: format-check staged .lua and .ts files
 *   3. Hero validation: check staged hero files for buy-list duplicates
 */

const { execSync, spawnSync } = require('child_process');
const path = require('path');
const fs = require('fs');

// Fail fast with a helpful message if dependencies aren't installed.
if (!fs.existsSync(path.join('node_modules', '.bin', 'prettier'))) {
    console.error('[pre-commit] node_modules not found. Run: npm install');
    process.exit(1);
}

function run(cmd, opts = {}) {
    return spawnSync(cmd[0], cmd.slice(1), {
        stdio: 'inherit',
        shell: true, // required on Windows to resolve .cmd shims (npx.cmd, node.cmd, etc.)
        ...opts,
    });
}

function stagedFiles() {
    try {
        return execSync('git diff --cached --name-only', { encoding: 'utf8' })
            .trim()
            .split('\n')
            .filter(Boolean);
    } catch {
        return [];
    }
}

const staged = stagedFiles();

// --- 1. TypeScript → Lua: rebuild if any .ts source is staged -------------
const tsFiles = staged.filter(
    (f) => /^typescript\/bots\/.*\.ts$/.test(f) && !f.endsWith('.d.ts'),
);
if (tsFiles.length > 0) {
    console.log('[pre-commit] TypeScript source changes detected. Rebuilding Lua outputs...');
    if (run(['npm', 'run', 'build']).status !== 0) process.exit(1);
    if (run(['git', 'add', 'bots/']).status !== 0) process.exit(1);
    console.log('[pre-commit] Lua outputs rebuilt and staged.');
}

// --- 2. Prettier: check staged .ts files ---------------------------------
// Prettier has no Lua parser; only TypeScript files are checked.
// Use the locally-installed binary to avoid downloading a different version.
const fmtFiles = staged.filter((f) => f.endsWith('.ts') && !f.endsWith('.d.ts'));
if (fmtFiles.length > 0) {
    console.log('[pre-commit] Checking TypeScript formatting...');
    const prettierBin = path.join('node_modules', '.bin', 'prettier');
    const r = run([prettierBin, '--check', ...fmtFiles]);
    if (r.status !== 0) {
        console.error('[pre-commit] Formatting errors found. Run: npm run prettier');
        process.exit(1);
    }
}

// --- 3. Hero validation: buy-list duplicates ------------------------------
const heroFiles = staged.filter((f) => /^bots\/BotLib\/hero_.*\.lua$/.test(f));
if (heroFiles.length > 0) {
    console.log('[pre-commit] Validating hero files...');
    if (run(['node', 'scripts/validate-heroes.js']).status !== 0) process.exit(1);
}

console.log('[pre-commit] All checks passed.');
