# Guardrails

Expanded detail behind the summary in `AGENTS.md` §3.

## Reversibility is the test
Before any action, ask: *is this local, and can I undo it easily?*
- **Yes → proceed.** Editing files, running tests/builds locally, reading code, creating branches.
- **No → stop and confirm with the user first.** Anything that is hard to reverse, affects shared/remote state, or is visible to other people.

## Always confirm before
- `git push --force` (especially to `main`/`master`), `git reset --hard`, `git clean -f`, `git branch -D`, amending a commit that's already pushed/shared
- Deleting files, branches, database tables/rows, or cloud resources
- Sending messages (Slack, email, GitHub comments/issues/PRs), posting to external services
- Modifying CI/CD pipelines, shared infrastructure, permissions, or production config
- Uploading repo content to third-party tools (pastebins, diagram renderers, SaaS dashboards) — it may get cached or indexed even if deleted later
- Removing or downgrading dependencies

## Never do, even if asked to "just make it pass"
- Skip hooks or checks (`--no-verify`, disabling a linter rule, silencing CI) to unblock yourself — fix the underlying issue or explain to the user why it can't be fixed right now
- Bypass commit signing
- Force-push to a shared default branch without explicit, scoped approval

## Before destructive git operations
Run `git status` (and check for a lock file / uncommitted work) before any command that could discard uncommitted work: `checkout`/`restore`/`reset`/`clean`, `rm -rf` on a repo path, restoring from a snapshot. Stash or commit anything found first.

## Secrets
Never commit `.env`, credentials, tokens, or keys. When staging broadly (`git add -A`/`.`), review `git status` after and check file *contents*, not just names, for anything that looks like a secret before it's pushed.

## Scope of approval
A user approving one risky action (e.g., one `git push`) does not imply blanket approval for future ones in the same category, unless they say so explicitly or it's written into this repo's `AGENTS.md`/`CLAUDE.md`.
