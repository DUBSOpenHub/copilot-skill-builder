# 🧰 Copilot Skill Builder

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Platform: Copilot CLI](https://img.shields.io/badge/platform-Copilot%20CLI-232F3E.svg)

Turn any prompt into a ready-to-review GitHub Copilot CLI skill.

Many people can describe what they want an AI assistant to do, but they might not know how to package that idea into something reusable. They may not know the prompts, YAML, repo structure, install steps, or skill design. So their ideas stay trapped in one-off chats.

Copilot Skill Builder changes that. It turns any prompt into a ready-to-review GitHub Copilot CLI skill.

Example: You type: “Build me a helper that summarizes my GitHub issues every morning.” It asks a few simple questions, shows a short plan, and generates a ready-to-review GitHub Copilot CLI skill with install instructions, docs, and a try-it-now command.

> **⚡ One Command. That's It**
>
> **Never used the CLI before? No problem.** Paste this into your terminal:
>
> ```bash
> curl -fsSL https://raw.githubusercontent.com/DUBSOpenHub/copilot-skill-builder/main/quickstart.sh | bash
> ```
>
> When Copilot opens, type:
>
> ```text
> skill builder
> ```
>
> That's it — turn any prompt into a reusable Copilot skill. 🚀
>
> *Requires an active [Copilot subscription](https://github.com/features/copilot/plans).*

## What it does

You describe the helper you want with any prompt. Copilot Skill Builder asks at most
three simple questions, shows a short plan, then creates a complete skill folder
with:

- `SKILL.md`
- `catalog.yml`
- `README.md`
- `WHAT_WAS_BUILT.md`

## How it works

```mermaid
flowchart TD
    A["Your prompt<br/>I want a helper that does X"] --> B["Copilot Skill Builder"]
    B --> C["At most 3 simple questions"]
    C --> D["Plan Card<br/>name, trigger, output, install path"]
    D --> E{"Create it?"}
    E -- Edit --> C
    E -- Cancel --> Z["No files created"]
    E -- Create --> F["Generated skill folder<br/>SKILL.md + catalog.yml + README + WHAT_WAS_BUILT.md"]
    F --> G["Try it locally<br/>/skills add generated-skills/name"]
    G --> H["Optional next step<br/>Send it through Dark Factory for sealed quality checks"]
```

Copilot Skill Builder creates the first working skill scaffold. Dark Factory is
the next step when you want a production-grade build line with spec,
architecture, hidden quality checks, validation, and hardening.

## Install

### One-command install

```bash
curl -fsSL https://raw.githubusercontent.com/DUBSOpenHub/copilot-skill-builder/main/quickstart.sh | bash
```

### Manual install

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

## License

Released under the [MIT License](LICENSE).

---

## Built with Love

🐙 Created with 💜 by @DUBSOpenHub with the GitHub Copilot CLI.

Let's build! 🚀✨
