# Security Policy

## Reporting a vulnerability

Please do not report security issues in public issues. Use GitHub private
vulnerability reporting or open a private security advisory for this repository.

## Supported versions

| Version | Supported |
|---|---|
| `main` | ✅ |

## Security principles

Copilot Skill Builder should:

- never ask users to paste tokens, passwords, API keys, or other secrets;
- default generated skills to read-only behavior where possible;
- avoid destructive commands unless the user explicitly asks for them;
- clearly document external services or data sources before using them;
- keep generated skills easy to inspect and remove.

## Maintainer checklist

- Keep Dependabot enabled for GitHub Actions.
- Keep GitHub vulnerability alerts enabled.
- Review generated-skill examples for secret-handling risks.
- Run `bash tests/check-skill-builder.sh` before release.
