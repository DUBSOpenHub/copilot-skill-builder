# 🧰 Copilot Skill Builder

Turn any prompt into a ready-to-review GitHub Copilot CLI skill.

Many people can describe what they want an AI assistant to do, but they might not know how to package that idea into something reusable. They may not know the prompts, YAML, repo structure, install steps, or skill design. So their ideas stay trapped in one-off chats.

Copilot Skill Builder changes that. It turns any prompt into a ready-to-review GitHub Copilot CLI skill.

Example: You type: “Build me a helper that summarizes my GitHub issues every morning.” It asks a few simple questions, shows a short plan, and generates a ready-to-review GitHub Copilot CLI skill with install instructions, docs, and a try-it-now command.

## What it does

You describe the helper you want with any prompt. Copilot Skill Builder asks at most
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

## Built by Dark Factory

Copilot Skill Builder was built with [Dark Factory](https://github.com/DUBSOpenHub/dark-factory), the sealed-envelope Copilot CLI build system. Dark Factory turned the product idea into a tested skill repo using its factory line: spec, architecture, hidden quality checks, implementation, validation, and hardening.

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
