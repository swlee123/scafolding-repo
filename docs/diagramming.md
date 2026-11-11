# Diagramming

Expanded detail behind the summary in `AGENTS.md` §6. The goal is to make a new feature or architectural change easy to understand at a glance — for the user and for whoever (human or agent) touches it next.

## When to produce one
- Starting a new feature with more than one moving part (new service/module, new integration, non-trivial state).
- Any architectural change: new component, changed data flow, new external dependency.
- Not needed for a small bug fix or a one-line change — use judgment; the point is clarity, not ceremony.

## Which type
- **Architecture diagram** — components, services, data stores, and how they connect. Use for anything touching system structure.
- **Sequence diagram** — the order of calls/interactions across components or services. Use when timing/ordering is the hard part to follow.
- **User-flow diagram** — the user-facing steps and decision points. Use for new flows, onboarding, or anything UX-facing.
- Pick whichever actually clarifies the change — don't produce all three by default.

## Format & storage
- Default to **Mermaid** (fenced ` ```mermaid ` blocks): plain text, diffable in git, renders natively on GitHub and in Claude artifacts — no extra tooling required.
- Save diagrams under `docs/diagrams/`, named for the feature (e.g. `docs/diagrams/checkout-flow.md`).
- Reference the diagram from the PR description or commit message — reviewers shouldn't have to go looking for it.
- If Mermaid's plain boxes-and-arrows look isn't enough (e.g. a diagram meant for a design review or stakeholder doc), it's fine to reach for a richer tool, but still check the result into `docs/diagrams/`.
