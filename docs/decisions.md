# Architecture & Design Decisions (ADRs)

Expanded detail behind the summary in `AGENTS.md` §6. `spec/` holds a dated record of why the system looks the way it does, so whoever — human or agent — touches it next doesn't have to reverse-engineer intent from the code.

## When to write one
- Any decision that would be expensive or disruptive to reverse: choice of database, framework, auth strategy, API style, major dependency, data model, deployment architecture.
- Not needed for routine implementation choices that don't constrain future work.

## Format
Copy `spec/template.md` to `spec/NNNN-short-title.md`, incrementing `NNNN` (`0001`, `0002`, …). Fill in:
- **Date** — when the decision was made, not when the file happened to be written.
- **Status** — `proposed` / `accepted` / `superseded` / `deprecated`.
- **Context** — the problem, constraints, and the actual data points that drove the decision (benchmarks, cost figures, incident reports, user research, etc.) — not just "we decided X."
- **Decision** — what was decided, stated plainly.
- **Alternatives considered** — what else was on the table and why it lost.
- **Consequences** — what gets easier or harder as a result.

## Superseding a decision
Don't delete or edit a past ADR to reflect a new decision. Write a new one, and update the old one's status to `superseded by NNNN`. The history of *why* is the point.
