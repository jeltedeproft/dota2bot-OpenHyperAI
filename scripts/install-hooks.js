#!/usr/bin/env node
/**
 * install-hooks.js
 *
 * Copies scripts/pre-commit.sh into .git/hooks/pre-commit and makes it executable.
 * Runs automatically on `npm install` via the "prepare" lifecycle script.
 *
 * To reinstall manually:  node scripts/install-hooks.js
 */

const fs = require('fs');
const path = require('path');

const rootDir = path.join(__dirname, '..');
const hookDir = path.join(rootDir, '.git', 'hooks');

if (!fs.existsSync(hookDir)) {
    console.log('[hooks] .git/hooks not found — skipping (not a git repo or hooks dir missing).');
    process.exit(0);
}

const src = path.join(__dirname, 'pre-commit.sh');
const dest = path.join(hookDir, 'pre-commit');

fs.copyFileSync(src, dest);
fs.chmodSync(dest, 0o755);
console.log('[hooks] pre-commit hook installed at .git/hooks/pre-commit');
