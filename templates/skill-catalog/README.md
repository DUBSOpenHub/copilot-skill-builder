# My Copilot Skills

This private repo is the home for my GitHub Copilot CLI skills.

## Structure

```text
skills/
  skill-name/
    SKILL.md
    catalog.yml
    README.md
    WHAT_WAS_BUILT.md
```

## Install a skill

From GitHub Copilot CLI:

```text
/skills add ./skills/<skill-name>
```

## Safety

- Do not commit secrets, tokens, API keys, or webhook URLs.
- Keep each skill easy to inspect and remove.
- Prefer read-only behavior unless writing is intentional.
- Run validation before sharing a skill.
