#!/bin/sh
# Pre-commit hook for dota2bot-OpenHyperAI
# Installed automatically by: npm install  (via the "prepare" script)
# To skip in an emergency:  git commit --no-verify
set -e

# --- 1. TypeScript → Lua: rebuild if any .ts source file is staged --------
# Only rebuild when needed — most commits only touch Lua hero files.
STAGED_TS=$(git diff --cached --name-only | grep '^typescript/bots/.*\.ts$' | grep -v '\.d\.ts$' || true)
if [ -n "$STAGED_TS" ]; then
    echo "[pre-commit] TypeScript source changes detected. Rebuilding Lua outputs..."
    npm run build
    # Stage the regenerated Lua files so they're part of this commit
    git add bots/
    echo "[pre-commit] Lua outputs rebuilt and staged."
fi

# --- 2. Prettier: check formatting of staged .lua and .ts files -----------
STAGED_FMT=$(git diff --cached --name-only | grep -E '\.(lua|ts)$' | grep -v '\.d\.ts$' || true)
if [ -n "$STAGED_FMT" ]; then
    echo "[pre-commit] Checking code formatting..."
    # shellcheck disable=SC2086
    npx prettier --check $STAGED_FMT
fi

# --- 3. Hero file validation: duplicates in buy/sell lists ----------------
STAGED_HEROES=$(git diff --cached --name-only | grep '^bots/BotLib/hero_.*\.lua$' || true)
if [ -n "$STAGED_HEROES" ]; then
    echo "[pre-commit] Validating hero files..."
    node scripts/validate-heroes.js
fi

echo "[pre-commit] All checks passed."
