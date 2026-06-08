# AGENTS.md — Working Guide for AI Agents

This repo contains **Copilot Skill Builder**, a single GitHub Copilot CLI skill
that turns any prompt into a ready-to-review Copilot CLI skill scaffold.

## Architecture

```text
SKILL.md                  Runtime skill prompt
catalog.yml               Skill metadata
config.yml                Skill Builder defaults
quickstart.sh             One-command installer
tests/check-skill-builder.sh
docs/TESTING.md
```

There are no sub-agents, services, package managers, dashboards, or background
processes. Keep it prompt-only and beginner-friendly.

## Change rules

| File | Purpose | Rule |
|---|---|---|
| `SKILL.md` | Runtime behavior | Most important file; keep concise and non-technical |
| `catalog.yml` | Install metadata | Keep name, description, and `links.skill_file` accurate |
| `config.yml` | Defaults | Do not hardcode values in `SKILL.md` that belong here |
| `README.md` | Product story | Keep the one-command install and credits current |
| `quickstart.sh` | Installer | Keep safe, readable, and idempotent |
| `tests/check-skill-builder.sh` | Static checks | Update when required files or metadata change |

## Non-negotiables

1. Keep the skill understandable to non-technical users.
2. Never ask users to paste secrets, tokens, or credentials.
3. Do not add dashboards, daemons, package managers, hosted services, or plugin systems.
4. Generated skills should be prompt-only unless the user explicitly asks for more.
5. Run validation before committing:

   ```bash
   bash tests/check-skill-builder.sh
   ```

6. Run markdown lint before release when available.

## Tone

Warm, direct, and empowering. Focus on what the user can create.
