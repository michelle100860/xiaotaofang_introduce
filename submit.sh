#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./submit.sh
#   ./submit.sh "your commit message"

COMMIT_MSG="${1:-beautify index page}"

git add .

# Skip commit if there are no staged changes.
if git diff --cached --quiet; then
  echo "No staged changes to commit."
else
  git commit -m "$COMMIT_MSG"
fi

git push -u origin main:gh-pages

echo "Done: pushed main to gh-pages."
