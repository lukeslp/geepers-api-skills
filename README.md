# dreamer-api-skills

Agent Skills for the [dr.eamer.dev](https://dr.eamer.dev) public API — LLM chat, structured data, multi-agent orchestration, corpus linguistics, and etymology.

## Install

### Claude Code
```bash
/plugin add lukeslp/dreamer-api-skills
```

### OpenAI Codex
```bash
for s in dreamer-llm dreamer-data dreamer-orchestrate dreamer-corpus dreamer-etymology; do
  cp -a "skills/$s" "$HOME/.codex/skills/$s"
done
```

### Gemini CLI
```bash
gemini extensions link .
```

## Skills

| Skill | Purpose |
|-------|---------|
| `dreamer-llm` | Chat, vision, image gen, TTS across 12 LLM providers |
| `dreamer-data` | Structured data from 17 authoritative APIs |
| `dreamer-orchestrate` | Dream Swarm (parallel) and Dream Cascade (hierarchical) multi-agent workflows |
| `dreamer-corpus` | COCA corpus: word frequency, collocations, concordance |
| `dreamer-etymology` | Word etymology and historical sound change data |

## Authentication

All skills use the `https://api.dr.eamer.dev` public gateway. API keys are free:
- Email luke@lukesteuber.com
- Or visit https://dr.eamer.dev

Rate limit: 10,000 requests/day per key.

## License

MIT
