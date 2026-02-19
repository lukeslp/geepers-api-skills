# Repository Guidelines

## Project Structure & Module Organization
This repository is a synced OpenClaw/ClawHub mirror of geepers skills.
- `skills/<skill-name>/SKILL.md`: required instruction file for each skill.
- `README.md`: install and sync workflow.
- `clawhub-package.json`: package metadata.
- `publish-to-clawhub.sh`: bulk publish script.

Keep skill folders self-contained and aligned with canonical naming.

## Build, Test, and Development Commands
This repo is distribution-focused; validate mirrored content after sync.

```bash
# List all skills
find skills -mindepth 2 -maxdepth 2 -name SKILL.md | sort

# Validate required frontmatter keys
rg -n "^(name|description):" skills/*/SKILL.md

# Validate metadata JSON
python3 -m json.tool clawhub-package.json >/dev/null

# Optional publish
bash publish-to-clawhub.sh
```

## Coding Style & Naming Conventions
- Every `SKILL.md` starts with YAML frontmatter.
- Required keys: `name`, `description`.
- Use lowercase kebab-case for skill names and folders.
- Keep instructions concise and example-driven.

## Testing Guidelines
- Run frontmatter checks for all changed skills.
- Validate `clawhub-package.json` after sync.
- Test each edited skill manually in a target client.

## Commit & Pull Request Guidelines
Use Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`).
- Keep changes scoped to one logical concern.
- Include changed paths and validation commands in PRs.

## Security & Configuration Tips
- Never commit API keys, tokens, or local credentials.
- Keep temporary artifacts out of version control.
