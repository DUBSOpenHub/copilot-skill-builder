#!/usr/bin/env bash
set -euo pipefail

failures=0

ok() {
  echo "OK: $*"
}

fail() {
  echo "FAIL: $*"
  failures=$((failures + 1))
}

check_file() {
  local path="$1"
  if [[ -f "$path" ]]; then
    ok "file exists: $path"
  else
    fail "missing file: $path"
  fi
}

echo "Copilot Skill Builder validation"
echo

check_file "SKILL.md"
check_file "catalog.yml"
check_file "config.yml"
check_file "README.md"
check_file "docs/TESTING.md"
check_file "AGENTS.md"
check_file "SECURITY.md"
check_file "LICENSE"
check_file "quickstart.sh"
check_file ".github/dependabot.yml"
check_file "templates/skill-catalog/README.md"
check_file "templates/skill-catalog/AGENTS.md"
check_file "templates/skill-catalog/SECURITY.md"
check_file "templates/skill-catalog/LICENSE"
check_file "templates/skill-catalog/.github/dependabot.yml"
check_file "templates/skill-catalog/.github/workflows/validate.yml"
check_file "templates/skill-catalog/tests/validate-skills.sh"

if python3 - <<'PY'
import yaml
for path in ("catalog.yml", "config.yml"):
    with open(path, "r", encoding="utf-8") as f:
        yaml.safe_load(f)
PY
then
  ok "YAML parses"
else
  fail "YAML parse failed"
fi

if python3 - <<'PY'
import pathlib
import sys
import yaml

root = pathlib.Path(".")
catalog = yaml.safe_load(root.joinpath("catalog.yml").read_text(encoding="utf-8"))
skill_file = catalog.get("links", {}).get("skill_file")
if not skill_file or not root.joinpath(skill_file).is_file():
    print(f"missing skill_file reference: {skill_file}")
    sys.exit(1)
PY
then
  ok "catalog references exist"
else
  fail "catalog references missing"
fi

if head -1 SKILL.md | grep -q '^---$'; then
  ok "SKILL.md frontmatter starts"
else
  fail "SKILL.md frontmatter missing"
fi

skill_lines=$(wc -l < SKILL.md)
if [[ "$skill_lines" -le 180 ]]; then
  ok "SKILL.md is reviewable ($skill_lines lines)"
else
  fail "SKILL.md too long ($skill_lines lines)"
fi

for term in "copilot skill builder" "skill builder" "/skills add"; do
  if grep -Rqi "$term" README.md SKILL.md catalog.yml; then
    ok "term present: $term"
  else
    fail "term missing: $term"
  fi
done

if grep -q "DUBSOpenHub/dark-factory" quickstart.sh README.md SKILL.md; then
  ok "Dark Factory dependency is documented and installed"
else
  fail "Dark Factory dependency missing"
fi

if grep -q "Build with Dark Factory" SKILL.md README.md; then
  ok "handoff approval is documented"
else
  fail "handoff approval missing"
fi

if [[ -x "quickstart.sh" ]]; then
  ok "quickstart.sh is executable"
else
  fail "quickstart.sh is not executable"
fi

if grep -q "MIT License" LICENSE && grep -q "MIT" catalog.yml; then
  ok "MIT license is present and referenced"
else
  fail "MIT license missing or not referenced"
fi

if grep -q "default_catalog_visibility: private" config.yml; then
  ok "skill catalog defaults to private"
else
  fail "skill catalog does not default to private"
fi

if grep -qi "secret scanning" templates/skill-catalog/SECURITY.md && \
   grep -qi "Dependabot" templates/skill-catalog/SECURITY.md; then
  ok "skill catalog security guidance present"
else
  fail "skill catalog security guidance missing"
fi

if [[ "$failures" -eq 0 ]]; then
  echo
  echo "All Copilot Skill Builder checks passed."
  exit 0
fi

echo
echo "$failures check(s) failed."
exit 1
