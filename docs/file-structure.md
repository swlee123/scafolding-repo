# File Structure

Expanded detail behind `AGENTS.md` §5. Target layout for a new repo bootstrapped from this template — adapt to the language/framework, but keep the agent-facing files at these exact paths so every tool finds them without configuration.

```
.
├── AGENTS.md                      # canonical agent rules (source of truth)
├── CLAUDE.md                      # thin, @AGENTS.md + Claude-specific notes
├── README.md                      # human-facing project overview
├── .github/
│   ├── copilot-instructions.md    # thin pointer to AGENTS.md
│   └── workflows/                 # CI
├── docs/
│   ├── guardrails.md
│   ├── coding-conventions.md
│   ├── file-structure.md
│   ├── diagramming.md
│   └── decisions.md
├── spec/                           # dated architecture/design decisions (ADRs) — see docs/decisions.md
│   ├── template.md
│   └── 0001-*.md
├── scripts/
│   └── bootstrap.sh
├── src/                            # application code
├── tests/                          # test suite, mirrors src/ — mandatory from the first commit
└── .env.example                    # placeholder keys; real .env is gitignored
```

## Monorepos / subprojects
Each subproject may ship its own `AGENTS.md`. Agents must use the nearest one in the directory tree, not the root one, when working inside that subtree. Keep root `AGENTS.md` for rules that apply everywhere (security guardrails, commit conventions); push project-specific stack/build details into the subproject's own file.

## Adding a new tool's config
When adopting a new AI tool that reads its own file (e.g. `.cursor/rules/`, `.windsurfrules`), make it a thin pointer back to `AGENTS.md`, mirroring `CLAUDE.md`. Don't duplicate the rules themselves.
