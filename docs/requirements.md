# Requirements Gathering (Working Backwards)

Expanded detail behind the summary in `AGENTS.md` §6. Before implementation starts, gather requirements by working backwards from the desired end state — what the user experiences once this exists — rather than starting from the technology or the existing codebase's shape.

## When to write one
- Any new feature or initiative substantial enough to warrant its own `spec/` ADR or a `docs/diagrams/` entry — same threshold as those.
- Not needed for a small bug fix or an internal, low-stakes change.

## Process
1. Copy `requirements/template.md` to `requirements/short-title.md`.
2. Start from the **desired outcome** — describe the end state as if it already exists, in plain language, before listing a single requirement. If you can't describe what's different for the user once this ships, the idea isn't ready to spec.
3. Define success criteria — how you'll know it worked.
4. Derive the actual requirements from that outcome, not the other way around.
5. Work through the key questions (who it's for, smallest testable version, assumptions, risks, explicit non-goals) before moving on.
6. Once requirements are agreed, move to execution: [docs/diagramming.md](diagramming.md) for how it works, [docs/decisions.md](decisions.md) for the technical decisions made along the way.

## Relationship to spec/ and docs/diagrams/
- `requirements/` answers *why* and *for whom* — the problem/outcome stage, before architecture exists.
- `spec/` ADRs answer *how* — the technical decisions made to build it.
- `docs/diagrams/` shows *how it fits together* once the shape is known.
- They build on each other in that order.
