#!/bin/sh
# Pre-commit hook entry point.
# All logic lives in scripts/pre-commit.js (Node.js, cross-platform).
# To skip in an emergency: git commit --no-verify
node scripts/pre-commit.js
