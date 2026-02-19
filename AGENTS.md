# Repository Guidelines

## Project Structure & Module Organization
This repository contains API-focused skill packs for `api.dr.eamer.dev`.
- `skills/<skill-name>/SKILL.md`: required instructions for each API skill.
- `.claude-plugin/`: plugin metadata for distribution.
- `publish-to-clawhub.sh`: publish helper script.
- `README.md`: install targets for Claude Code, Codex, and Gemini CLI.

Use clear skill boundaries (LLM, data, orchestration, corpus, etymology) and keep each folder self-contained.

## Build, Test, and Development Commands
Focus on skill validation and install smoke tests.

```bash
# Discover all skills
find skills -mindepth 2 -maxdepth 2 -name SKILL.md | sort

# Confirm frontmatter keys exist
rg -n "^(name|description):" skills/*/SKILL.md

# Install into Codex for local smoke test
for s in geepers-llm geepers-data geepers-orchestrate geepers-corpus geepers-etymology; do
  cp -a "skills/$s" "$HOME/.codex/skills/$s"
done

# Optional publish workflow
bash publish-to-clawhub.sh
```

## Coding Style & Naming Conventions
- Every `SKILL.md` must start with YAML frontmatter.
- Required keys: `name`, `description`.
- Keep names lowercase kebab-case and aligned with directory names.
- Use concise, API-specific instructions with concrete endpoint/use-case examples.

## Testing Guidelines
- Run frontmatter checks on every changed skill.
- Smoke-test at least one prompt per edited skill after install.
- For publish script changes, run shell syntax check (`bash -n publish-to-clawhub.sh`).

## Commit & Pull Request Guidelines
Commit history uses semantic prefixes (`feat:`, `refactor:`).
- Continue Conventional Commits.
- Keep PRs scoped and list affected skills.
- Include validation commands and any API behavior assumptions.

## Security & Configuration Tips
- Never commit API keys or secrets.
- Avoid embedding credentials in examples; use environment-variable placeholders.
