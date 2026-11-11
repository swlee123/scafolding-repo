#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <target-repo-path>" >&2
  exit 1
fi

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$1"

if [ ! -d "$TARGET" ]; then
  echo "Target directory does not exist: $TARGET" >&2
  exit 1
fi

FILES=(
  "AGENTS.md"
  "CLAUDE.md"
  ".github/copilot-instructions.md"
  "docs/guardrails.md"
  "docs/coding-conventions.md"
  "docs/file-structure.md"
  "docs/diagramming.md"
  "docs/decisions.md"
  "docs/working-backwards.md"
  "spec/template.md"
  "prfaq/template.md"
)

for rel in "${FILES[@]}"; do
  dest="$TARGET/$rel"
  if [ -e "$dest" ]; then
    echo "Skipping existing file: $rel"
    continue
  fi
  mkdir -p "$(dirname "$dest")"
  cp "$SRC_DIR/$rel" "$dest"
  echo "Added: $rel"
done

echo "Done. Review $TARGET/AGENTS.md and adapt the project-specific sections (stack, commands) if needed."
