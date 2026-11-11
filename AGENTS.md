# AGENTS.md

Canonical, tool-agnostic rules for any AI coding agent (Claude Code, Codex, Cursor, Copilot, etc.) working in this repository. This file is the source of truth — `CLAUDE.md`, `.github/copilot-instructions.md`, and any other tool-specific file should import or point back to this one rather than duplicating it.

If a repo built from this template contains subprojects, the nearest `AGENTS.md` in the directory tree wins for that subtree.

## 0. Project Context (fill in per project)
- **Stack:**
- **Build / test / lint commands:**
- **Entry points:**
- **Anything else an agent needs to know before touching code:**

## 1. Scope & Priority
1. Direct, explicit instructions from the user in the current conversation.
2. This file and anything it links to under `docs/`.
3. Tool-specific files (`CLAUDE.md`, `.cursor/rules`, etc.) for agent-specific mechanics only — they must not contradict this file.
4. Default judgment, informed by the conventions below.

## 2. Core Principles
- Do what's asked, nothing more. No speculative features, no refactors beyond the task, no abstractions for hypothetical future needs.
- Match the scope of the task. Three similar lines beat a premature abstraction.
- Prefer editing existing files over creating new ones. Don't create documentation files unless asked.
- Trust internal code and framework guarantees; validate only at system boundaries (user input, external APIs, untrusted data).

## 3. Safety & Guardrails
Full detail in [docs/guardrails.md](docs/guardrails.md). Summary:
- **Confirm before** anything hard to reverse or visible to others: force-push, `reset --hard`, deleting branches/files/DB tables, sending messages, posting to external services, modifying CI/CD or shared infra, uploading data to third-party tools.
- **Never** skip hooks (`--no-verify`), bypass signing, or silence a failing check to make it "go away" — fix the root cause.
- **Investigate before overwriting.** Unfamiliar files/branches/state may be someone's in-progress work. Prefer a reversible move (stash, rename, move aside) over deletion.
- **Never commit secrets.** Check file contents, not just filenames, before staging.
- Local, reversible actions (editing files, running tests, reading code) don't need confirmation.

## 4. Coding Conventions
Full detail in [docs/coding-conventions.md](docs/coding-conventions.md). Summary:
- No comments unless they explain a non-obvious *why* (hidden constraint, workaround, surprising behavior). Never explain *what* the code does.
- No error handling for cases that can't happen.
- No backwards-compatibility shims, feature flags, or `_unused` renames for code you're certain is dead — delete it.
- Keep names, structure, and style consistent with the surrounding file before introducing your own preference.
- No hardcoded values — environment-specific config and constants come from `.env`/config, not inline literals.
- Secrets always live in `.env` (gitignored, with a `.env.example` committed), never hardcoded or committed.
- Default naming is `snake_case`, unless the language ecosystem has its own strong convention.
- Every project has a `tests/` directory from the first commit, not added later.
- Default to AWS for cloud infrastructure unless there's a clear reason to use something else.

## 5. File & Project Structure
Full detail in [docs/file-structure.md](docs/file-structure.md).

## 6. Workflow
- For multi-step work, track progress with a todo/task list; update it as you go, not in a batch at the end.
- Before starting a significant new feature, gather requirements by working backwards: describe the desired end state first, then derive requirements from it — in `requirements/`, before any implementation. See [docs/requirements.md](docs/requirements.md).
- When starting a new feature or architectural change, produce a diagram — architecture, sequence, or user-flow, whichever best clarifies the change — before or alongside implementation. Default to Mermaid, saved under `docs/diagrams/`. See [docs/diagramming.md](docs/diagramming.md).
- When making a significant architecture/design decision, record it as a dated ADR in `spec/` — what was decided, when, and the data points behind it — so the next person or agent knows why things are the way they are. See [docs/decisions.md](docs/decisions.md).
- Plan → implement → verify. Run the project's actual test/lint/build commands before calling work done; don't just claim success.
- For UI changes, actually exercise the feature (run it, click through it) before reporting completion.
- Give brief progress updates at key moments (found something, changed direction, hit a blocker) — don't narrate step by step, and don't go silent on long tasks.

## 7. Commits & PRs
- Only commit or open a PR when explicitly asked.
- Create new commits rather than amending, unless told otherwise.
- Write commit messages that explain *why*, not just *what changed*.
- Never force-push to a shared/default branch.

## 8. Definition of Done
- Code matches the request, nothing more.
- Existing tests pass; new behavior has test coverage where the project has a test suite.
- No stray debug output, commented-out code, or TODOs left behind without flagging them to the user.
- Any deviation from the above was explicitly called out, not silently done.

## 9. Bootstrapping a New Repo
Run `scripts/bootstrap.sh <path-to-new-repo>` from this repo to copy `AGENTS.md`, `CLAUDE.md`, `.github/copilot-instructions.md`, and `docs/` into a new project. See [README.md](README.md).
