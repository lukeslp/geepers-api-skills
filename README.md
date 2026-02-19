# geepers-api-skills

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Language: Markdown](https://img.shields.io/badge/language-markdown-blue.svg)](https://daringfireball.net/projects/markdown/)
[![Live API](https://img.shields.io/badge/api-live-brightgreen.svg)](https://api.dr.eamer.dev/v1/)

API skill pack for `https://api.dr.eamer.dev` with generated OpenClaw/ClawHub artifacts.

## Naming Transition

This repo path is still `dreamer-api-skills`, but canonical naming is now `geepers-api-skills`.

Legacy key alias remains supported:
- Preferred: `GEEPERS_API_KEY`
- Alias: `DREAMER_API_KEY`

## Source of Truth

This is a generated mirror from canonical skills in:
- `https://github.com/lukeslp/geepers`
- Canonical path: `skills/source/`

Direct edits to `skills/` should be made in canonical source, then synced.

## Skills

- `geepers-llm`
- `geepers-data`
- `geepers-orchestrate`
- `geepers-corpus`
- `geepers-etymology`

## Install

### Claude Code
```bash
/plugin add lukeslp/geepers-api-skills
```

### Codex
```bash
for s in geepers-llm geepers-data geepers-orchestrate geepers-corpus geepers-etymology; do
  cp -a "skills/$s" "$HOME/.codex/skills/$s"
done
```

### Gemini CLI
```bash
gemini extensions link .
```

## API Access

Get an API key:
- https://dr.eamer.dev/code/api-access/

API docs:
- https://dr.eamer.dev/code/api/

## OpenClaw / ClawHub Artifacts

- `clawhub-package.json`
- `aliases.generated.json`

## License

MIT — see [LICENSE](LICENSE)

Built by [Luke Steuber](https://lukesteuber.com) · [luke@lukesteuber.com](mailto:luke@lukesteuber.com) · [@lukesteuber.com](https://bsky.app/profile/lukesteuber.com)
