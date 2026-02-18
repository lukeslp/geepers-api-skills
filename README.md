# geepers-api-skills

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Language: Markdown](https://img.shields.io/badge/language-markdown-blue.svg)](https://daringfireball.net/projects/markdown/)
[![Live API](https://img.shields.io/badge/api-live-brightgreen.svg)](https://api.dr.eamer.dev/v1/)

Five Claude Code skills that give you direct access to the [dr.eamer.dev public API](https://api.dr.eamer.dev/v1/). Each skill is a SKILL.md file that teaches Claude Code the endpoints, parameters, and patterns for a specific capability area. No SDK, no wrappers — just Claude calling the API.

## Quick Start

```bash
/plugin add lukeslp/geepers-api-skills
```

That's it. The five skills install into Claude Code. Ask Claude to search arXiv, run a corpus query, or kick off a Dream Cascade research workflow and it knows what to call.

**Get an API key** at [https://dr.eamer.dev/code/api-access/](https://dr.eamer.dev/code/api-access/)

**API docs** at [https://dr.eamer.dev/code/api/](https://dr.eamer.dev/code/api/)

All endpoints require an `X-API-Key` header. The free tier allows 10,000 requests per day (resets at midnight UTC).

```bash
curl -X POST https://api.dr.eamer.dev/v1/llm/chat \
  -H "X-API-Key: your_key_here" \
  -H "Content-Type: application/json" \
  -d '{"provider": "xai", "messages": [{"role": "user", "content": "Hello"}]}'
```

---

## Skills

### geepers-llm

Chat, vision, image generation, speech synthesis, video generation, and embeddings across 13 providers.

**Endpoints:**
- `POST /v1/llm/chat` — Chat completion with streaming support. Providers: Anthropic, OpenAI, xAI, Mistral, Cohere, Gemini, Perplexity, Groq, HuggingFace, Ollama, Gradient, ElevenLabs, Manus.
- `GET /v1/llm/models` — List available models. Optionally filter by provider with `?provider=xai`.
- `POST /v1/llm/vision` — Analyze an image with a vision-capable model. Accepts base64 or URL.
- `POST /v1/llm/images/generate` — Generate an image from a text prompt. Providers: xAI, OpenAI, HuggingFace.
- `POST /v1/llm/speech` — Text-to-speech via ElevenLabs or OpenAI. Returns base64-encoded audio.
- `POST /v1/llm/embed` — Generate text embeddings via OpenAI or Ollama.
- `POST /v1/llm/video` — Generate video from a text prompt (flux-video-1).

**Example — stream a chat response:**
```json
{
  "provider": "anthropic",
  "messages": [{"role": "user", "content": "Explain diffusion models briefly."}],
  "stream": true
}
```

---

### geepers-data

17 structured data sources behind a unified search interface. No individual API keys needed on your end — the gateway handles authentication.

**Sources:**

| Category | Sources |
|----------|---------|
| Academic | arXiv, PubMed, Semantic Scholar, Open Library |
| Government | US Census Bureau, FEC campaign finance, Federal Judiciary |
| Science | NASA, Weather, Wolfram Alpha |
| Media | News, YouTube, Wikipedia |
| Technical | GitHub |
| Finance | Finance |
| Archives | Internet Archive, Wayback Machine |

**Endpoints:**
- `GET /v1/data/sources` — List all sources and their categories (no auth required).
- `GET /v1/data/{source}/search?query=...` — Search a source. Accepts `max_results` (default 10).
- `GET /v1/data/{source}/get/{id}` — Fetch a specific item by ID (arXiv paper ID, DOI, etc.).

**Example — search PubMed:**
```
GET /v1/data/pubmed/search?query=CRISPR+off-target+effects&max_results=5
```

---

### geepers-corpus

Search the COCA corpus (Corpus of Contemporary American English) plus historical English corpora. The corpus index contains 48M+ tokens spanning Old English, Middle English, Early Modern English, and contemporary American usage.

**Endpoints:**
- `GET /v1/corpus/search` — Concordance search. Returns matching sentences with context.
- `GET /v1/corpus/collocations` — Word co-occurrence data. Shows what words appear near a target word.
- `GET /v1/corpus/frequency` — Word frequency data across the corpus.

**Common parameters:**
- `word` — Target word
- `corpus` — Which corpus: `coca`, `old_english`, `middle_english`, `early_modern` (default: `coca`)

**Example — collocations for "algorithm":**
```
GET /v1/corpus/collocations?word=algorithm&corpus=coca
```

---

### geepers-etymology

Word origin exploration backed by a dedicated etymology service. Returns structured data for a word's full history: definition, pronunciation, cognates, related words, language lineage, and visualization data for network graphs.

**Endpoints:**
- `GET /v1/etymology/explore/{word}` — Full etymology analysis for a word.
- `GET /v1/etymology/health` — Service health check.

**Query parameters for `/explore/{word}`:**
| Parameter | Options | Default |
|-----------|---------|---------|
| `viz_type` | `network`, `mermaid`, `matrix` | `network` |
| `adj_type` | `temporal`, `linguistic`, `semantic` | `temporal` |

**Response fields include:** etymology text, narrative summary, cognates list, related words, language lineage chain, and graph visualization data.

**Example:**
```
GET /v1/etymology/explore/window?viz_type=mermaid&adj_type=linguistic
```

---

### geepers-orchestrate

Two multi-agent research patterns that run multiple LLM queries in parallel and synthesize the results.

**Dream Swarm** — `POST /v1/orchestrate/dream-swarm`

Runs parallel search agents across a query from different angles. Good for quick multi-perspective research. Default: 5 agents.

```json
{
  "query": "impacts of remote work on urban housing prices",
  "num_agents": 5,
  "provider_name": "xai"
}
```

**Dream Cascade** — `POST /v1/orchestrate/dream-cascade`

Three-tier hierarchical research workflow. Belter agents (workers) run in parallel, Drummer agents synthesize groups of results, Camina provides a final executive synthesis. Good for deep research tasks. Default: 8 agents.

```json
{
  "task": "Analyze the regulatory landscape for autonomous vehicles in the EU",
  "num_agents": 8,
  "provider_name": "xai",
  "title": "EU AV Regulation Analysis"
}
```

**Response fields (both patterns):** `result` (final synthesis), `task_id`, `execution_time`, `agent_count`, `status`.

---

## Authentication

All protected endpoints require one of:

```http
X-API-Key: your_key_here
```
```http
Authorization: Bearer your_key_here
```
```
?api_key=your_key_here
```

The `X-API-Key` header is recommended.

Request a key at [https://dr.eamer.dev/code/api-access/](https://dr.eamer.dev/code/api-access/)

---

## Using the Skills in Claude Code

After installing the plugin, Claude Code knows how to call each endpoint. Some examples of what you can ask:

- "Search arXiv for papers on diffusion models from the last year"
- "What are the top collocations for 'crisis' in the COCA corpus?"
- "Trace the etymology of the word 'salary'"
- "Generate an image of a lighthouse at dusk using xAI"
- "Run a Dream Cascade on the geopolitics of semiconductor supply chains"

Claude will construct the correct API calls, handle authentication from your environment or a key you provide in the session, and present the results.

---

## License

MIT — see [LICENSE](LICENSE)

---

Built by [Luke Steuber](https://lukesteuber.com) — [luke@lukesteuber.com](mailto:luke@lukesteuber.com) — [@lukesteuber.com](https://bsky.app/profile/lukesteuber.com) on Bluesky
