🧰 # Copilot Skill Builder

Copilot Skill Builder turns "I want a helper that does X" into a ready-to-review
GitHub Copilot CLI skill.

It is the friendly front door for people who know what they want to create, but
do not want to learn skill structure, prompt files, YAML, repo wiring, or setup
steps first.

## What it does

You describe a useful helper in plain English. Copilot Skill Builder asks at most
three simple questions, shows a short plan, then creates a complete skill folder
with:

- `SKILL.md`
- `catalog.yml`
- `README.md`
- `WHAT_WAS_BUILT.md`

## Install

In GitHub Copilot CLI:

```text
/skills add DUBSOpenHub/copilot-skill-builder
```

Then start it with:

```text
copilot skill builder
```

or:

```text
skill builder
```

## Example

```text
skill builder
```

When asked what to build:

```text
Create a helper that summarizes the GitHub issues assigned to me each morning.
```

Copilot Skill Builder shows a short plan:

```text
Your new helper: Morning Issue Digest
Trigger: "morning digest"
What it does: Summarizes GitHub issues assigned to you.
What it uses: GitHub CLI
Where it will be saved: generated-skills/morning-issue-digest/
How to try it: /skills add generated-skills/morning-issue-digest
How to remove it: delete generated-skills/morning-issue-digest
```

After approval, it creates the skill files for you.

## Why this exists

Most people do not start by thinking, "I need a skill with this exact YAML and
prompt structure." They start with, "I wish Copilot could help me with this
workflow."

Copilot Skill Builder bridges that gap.

## What it does not do

This MVP does not create dashboards, package managers, hosted services, plugin
systems, or background daemons. It creates prompt-only Copilot CLI skills that
are easy to inspect, install, customize, and delete.

## Validation

Run:

```bash
bash tests/check-skill-builder.sh
```

The validation checks YAML syntax, catalog references, required files, prompt
frontmatter, and line counts.

---

## Built with Love

Created with love by [@DUBSOpenHub](https://github.com/DUBSOpenHub) with the GitHub Copilot CLI.
