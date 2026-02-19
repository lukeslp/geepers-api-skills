# geepers-api-skills

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Language: Markdown](https://img.shields.io/badge/language-markdown-blue.svg)](https://daringfireball.net/projects/markdown/)

Generated OpenClaw/ClawHub mirror for the geepers skills ecosystem.

## Naming Note

This repository path is still `dreamer-api-skills`; the canonical name is `geepers-api-skills`.
Legacy aliases stick around for safe migration.

## Source of Truth

This repository is generated from canonical skills in:
- `https://github.com/lukeslp/geepers`
- Canonical path: `skills/source/`

Direct edits to `skills/` in this repo are blocked by CI. Make changes in canonical source, then sync.

## What Is Here

- `skills/`: generated skill folders (full parity with other provider mirrors)
- `clawhub-package.json`: generated OpenClaw/ClawHub metadata
- `aliases.generated.json`: migration alias map
- `publish-to-clawhub.sh`: publish helper for all skills in `skills/`
- `.github/workflows/mirror-readonly-guard.yml`: mirror protection

## Install

### Claude Code
```bash
/plugin add lukeslp/geepers-api-skills
```

### Codex
```bash
for s in skills/*; do
  name=$(basename "$s")
  cp -a "$s" "$HOME/.codex/skills/$name"
done
```

### Gemini CLI
```bash
gemini extensions link .
```

## Sync Workflow

From canonical repo (`/home/coolhand/geepers`):

```bash
python3 scripts/validate-skills.py --strict
python3 scripts/build-platform-packages.py --platform clawhub --clean
bash scripts/sync-mirrors.sh --platform clawhub --delete --skip-build
bash scripts/report-drift.sh --platform clawhub --skip-missing
```

## License

MIT — see [LICENSE](LICENSE)

Built by [Luke Steuber](https://lukesteuber.com) · [luke@lukesteuber.com](mailto:luke@lukesteuber.com) · [@lukesteuber.com](https://bsky.app/profile/lukesteuber.com)
