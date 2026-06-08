# Security Policy

This repo may contain personal or team Copilot CLI skills. Keep it private unless
you intentionally want to share the skills.

## Do not commit

- API keys
- Slack tokens or webhook URLs
- OAuth credentials
- Passwords
- Private customer or company data

## Required GitHub settings

Copilot Skill Builder should activate every available setting automatically when
it creates this repo:

- Dependabot security updates
- Secret scanning
- Secret scanning push protection
- Vulnerability alerts
- Private vulnerability reporting
- Non-provider secret pattern scanning
- Secret scanning validity checks

The user should not need to find these settings manually.

## Reporting

If a generated skill contains risky behavior, remove it or disable it first,
then open an issue or private advisory in the relevant repo.
