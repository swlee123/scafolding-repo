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

## Naming & structure
- Match the file's existing naming convention, indentation, and style before applying personal preference.
- Prefer clear names over comments to convey intent.

## Testing
- If the project has a test suite, add/update tests for the behavior you change.
- Run the project's actual test/lint/build commands before calling the work done.

## Security
- Treat all external input as untrusted. Guard against injection (SQL, command, XSS) and other OWASP Top 10 classes.
- If you notice you've written something insecure, fix it immediately rather than leaving a note.
