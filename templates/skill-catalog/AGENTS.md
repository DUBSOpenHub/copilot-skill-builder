# AGENTS.md — My Copilot Skills

This private repo stores generated GitHub Copilot CLI skills.

## Rules for agents

1. Add every new skill under `skills/<skill-slug>/`.
2. Each skill must include `SKILL.md`, `catalog.yml`, `README.md`, and `WHAT_WAS_BUILT.md`.
3. Never commit secrets, tokens, API keys, webhook URLs, or passwords.
4. Prefer read-only behavior unless the user explicitly wants write actions.
5. Keep generated prompts short and reviewable.
6. Document install, try-it-now, remove, and known limits.

## Validation

Run:

```bash
bash tests/validate-skills.sh
```
