# scafolding-repo

Reusable AI-agent guardrails, conventions, and file structure — the rules any AI coding agent (Claude Code, Codex, Cursor, Copilot, etc.) should follow when working on my projects.

## Why this exists
Every new repo used to mean re-explaining the same conventions to whichever agent was writing the code. This repo is the single source of truth for those conventions, structured so every major agent tool finds it automatically:

- **`AGENTS.md`** — the canonical rules. Read first by Codex, Cursor, Copilot, Windsurf, Amp, and others that follow the [AGENTS.md convention](https://agents.md).
- **`CLAUDE.md`** — thin wrapper that imports `AGENTS.md` (`@AGENTS.md`) plus Claude Code-specific notes.
- **`.github/copilot-instructions.md`** — thin pointer back to `AGENTS.md` for GitHub Copilot.
- **`docs/`** — the expanded detail behind each summary in `AGENTS.md` (guardrails, coding conventions, file structure, diagramming, decisions).
- **`spec/`** — dated architecture/design decision records (ADRs): what was decided, when, and the data behind it. Copy `spec/template.md` for each new one.
- **`scripts/bootstrap.sh`** — copies all of the above into a new or existing repo.

## Using this for a new project

**Option A — GitHub template.** This repo is marked as a template; click "Use this template" when creating a new repo, then fill in `AGENTS.md` §0 (stack, commands, entry points) for the new project.

**Option B — bootstrap into an existing repo.**
```bash
git clone https://github.com/swlee123/scafolding-repo.git
./scafolding-repo/scripts/bootstrap.sh /path/to/your/other/repo
```
This copies `AGENTS.md`, `CLAUDE.md`, `.github/copilot-instructions.md`, and `docs/` into the target repo without overwriting anything that already exists there.

## Updating the convention
Edit the files here, then re-run `bootstrap.sh` against any repo that should pick up the change (existing files aren't overwritten there, so remove the old copy first if you want the update to land).

## Background
This structure follows the emerging [AGENTS.md standard](https://github.com/agentsmd/agents.md) and patterns from similar community templates:
- [agent-rules/agent-rules](https://github.com/agent-rules/agent-rules)
- [4thgen415-ui/guardrails-template](https://github.com/4thgen415-ui/guardrails-template)
- [florian101010/awesome-agentic-AI-coding-template](https://github.com/florian101010/awesome-agentic-AI-coding-template)
