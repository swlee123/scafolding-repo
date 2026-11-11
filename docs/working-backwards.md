# Working Backwards (PR/FAQ)

Expanded detail behind the summary in `AGENTS.md` §6. Amazon's "working backwards" method: write the press release and FAQ for a feature *before* building it, starting from the customer's experience rather than the technology. The doc is the spec — iterate on the writing until it's right, then build toward it.

## When to write one
- Any new feature or product surface significant enough to warrant its own `spec/` ADR or a `docs/diagrams/` entry — roughly the same threshold as those two.
- Not needed for a bug fix, a small enhancement, or internal tooling with no end user.

## Process
1. Copy `prfaq/template.md` to `prfaq/short-title.md`.
2. Write the press release first, in plain customer language — no implementation details, no internal jargon. If you can't explain the benefit in one sentence, the feature isn't well-formed yet.
3. Write the FAQ — customer-facing questions a real user would ask, and internal questions covering feasibility, cost, risk, and what success looks like.
4. Get the doc reviewed/agreed before writing code. Iterate on the document, not the product, at this stage.
5. Once agreed, move to execution: [docs/diagramming.md](diagramming.md) for how it works, [docs/decisions.md](decisions.md) for the technical decisions made along the way.

## Relationship to spec/ and docs/diagrams/
- `prfaq/` answers *why* and *for whom* — the product-definition stage, before architecture exists.
- `spec/` ADRs answer *how* — the technical decisions made to build it.
- `docs/diagrams/` shows *how it fits together* once the shape is known.
- They build on each other in that order. A PR/FAQ doesn't need to exist for every ADR — small technical decisions inside an already-agreed feature don't need a new one — but a significant new feature should have a PR/FAQ before its first ADR.
