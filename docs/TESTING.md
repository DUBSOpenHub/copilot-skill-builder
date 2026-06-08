# Testing Copilot Skill Builder

Copilot Skill Builder is a prompt-only GitHub Copilot CLI skill, so testing is
mostly static validation plus conversation playbooks.

## Static validation

Run:

```bash
bash tests/check-skill-builder.sh
```

Expected result:

```text
All Copilot Skill Builder checks passed.
```

## Playbook 1: Start from a clear idea

| Step | User action | Expected result |
|---|---|---|
| 1 | Run `skill builder` | Skill starts the intake flow |
| 2 | Say `Create a helper that summarizes my assigned GitHub issues` | No more than three questions |
| 3 | Approve the Plan Card | `BUILD-BRIEF.md` is created under `generated-skills/<slug>/` |
| 4 | Choose `Build with Dark Factory` | Dark Factory receives the brief or the skill prints the exact Dark Factory handoff command |
| 5 | After Dark Factory finishes, choose catalog destination | Skill is added to an existing skills repo or the user approves creating a private one |

## Playbook 2: Start from a vague idea

| Step | User action | Expected result |
|---|---|---|
| 1 | Run `skill builder` | Skill starts the intake flow |
| 2 | Say `Make something useful for my repo` | Skill asks clarifying questions |
| 3 | Answer questions | Skill stops at three questions or fewer |
| 4 | Approve the Plan Card | Dark Factory build brief is created |
| 5 | After Dark Factory finishes, confirm catalog repo | Skill offers private catalog repo creation if no repo exists |

## Playbook 3: Cancel before creation

| Step | User action | Expected result |
|---|---|---|
| 1 | Run `skill builder` | Plan Card is generated |
| 2 | Choose cancel | No generated skill files are created |

## Release checklist

- [ ] `bash tests/check-skill-builder.sh` passes.
- [ ] `SKILL.md` has valid frontmatter.
- [ ] `catalog.yml` references existing files.
- [ ] README includes install and try-it instructions.
- [ ] Generated examples do not ask for secrets.
- [ ] After Dark Factory finishes, the skill asks where to save the finished skill.
- [ ] New skills are added under `skills/<skill-slug>/` in the user's catalog repo after build completion.
- [ ] New catalog repos default to private and include `AGENTS.md`, `SECURITY.md`, Dependabot config, validation workflow, and license files.
- [ ] One-command install installs both Copilot Skill Builder and Dark Factory.
- [ ] After the Plan Card, the skill asks before handing off to Dark Factory.
