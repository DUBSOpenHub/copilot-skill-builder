#!/usr/bin/env bash
set -euo pipefail

if [[ ! -d skills ]]; then
  echo "No skills directory yet. Add skills under skills/<skill-slug>/."
  exit 0
fi

failed=0

for dir in skills/*; do
  [[ -d "$dir" ]] || continue
  for file in SKILL.md catalog.yml README.md WHAT_WAS_BUILT.md; do
    if [[ ! -f "$dir/$file" ]]; then
      echo "Missing $dir/$file"
      failed=1
    fi
  done
  if [[ -f "$dir/SKILL.md" ]] && ! head -1 "$dir/SKILL.md" | grep -q '^---$'; then
    echo "$dir/SKILL.md missing frontmatter"
    failed=1
  fi
done

exit "$failed"

