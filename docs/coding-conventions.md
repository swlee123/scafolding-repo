# Coding Conventions

Expanded detail behind the summary in `AGENTS.md` §4. These are defaults — a project's own style guide or linter config wins if it conflicts.

## Comments
- Default to none.
- Add a comment only when it captures a non-obvious *why*: a hidden constraint, a subtle invariant, a workaround for a specific bug, behavior that would surprise a reader.
- Never add a comment that just restates what well-named code already says.
- Never reference the current task, a ticket number, or "removed X" placeholders in comments — that belongs in the commit message, and it rots as the code evolves.

## Scope discipline
- Implement what was asked. Don't refactor, rename, or "clean up" surrounding code unless that's the task.
- Don't build abstractions, config options, or extension points for hypothetical future requirements.
- Three similar lines of code are better than a premature helper/abstraction.
- No half-finished implementations, and no feature flags/compat shims as a substitute for just changing the code.

## Error handling
- Validate and handle errors at system boundaries: user input, external APIs, network/filesystem calls, untrusted data.
- Don't add defensive checks for states that the type system or internal invariants already rule out.

## Configuration & secrets
- Never hardcode values that could change or that are environment-specific: URLs, ports, file paths, limits, feature toggles, API keys, credentials. Pull them from environment variables, a config file, or a named constant — not inline literals scattered through the code.
- All secrets (API keys, tokens, passwords, connection strings) live in a `.env` file, loaded at runtime. `.env` must be gitignored; commit a `.env.example` with placeholder keys instead.
- A literal is fine when it's genuinely fixed and meaningless outside the code (e.g. `HTTP_OK = 200`, a loop's `0`/`1`) — the rule targets values that vary by environment, deployment, or tenant, not every constant in existence.

## Naming & structure
- Default naming convention is `snake_case` — for variables, functions, and file names.
- If the language/ecosystem has a strong, near-universal convention of its own (e.g. `camelCase` in JavaScript/TypeScript, `PascalCase` for classes), follow that instead and note the exception in the project's `AGENTS.md` §0 — don't fight the ecosystem.
- Match the file's existing naming convention, indentation, and style before applying personal preference.
- Prefer clear names over comments to convey intent.

## Testing
- Every project gets a `tests/` directory from the first commit, not added later once something breaks — even a minimal project starts with at least a smoke test.
- Structure `tests/` to mirror `src/`.
- Run the project's actual test/lint/build commands before calling the work done.

## Infrastructure & cloud
- Default to AWS when a cloud provider is needed and nothing else is specified.
- This is a preference, not a lock-in: if another provider or a provider-agnostic approach (Terraform, Docker, etc.) clearly fits the task better, raise it and explain why before switching.

## Security
- Treat all external input as untrusted. Guard against injection (SQL, command, XSS) and other OWASP Top 10 classes.
- If you notice you've written something insecure, fix it immediately rather than leaving a note.
