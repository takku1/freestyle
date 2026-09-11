# Sources and design rationale

Consulted 2026-09-09. These are sources for selected additions, not dependencies that must be fetched at runtime. The original draft supplies the core loop, fast path, authority boundary, baseline compression, stall checkpoint, and convergence model.

| Primary source | Contribution | Limit of the adaptation |
| --- | --- | --- |
| [Google SRE: Effective Troubleshooting, Chris Jones](https://sre.google/sre-book/effective-troubleshooting/) | Hypothesis testing, participating boundaries, and separating urgent mitigation from diagnosis. | Its operational setting informs the skill; ordinary tasks do not inherit incident-management overhead. |
| [Amazon Builders' Library: Timeouts, retries, and backoff with jitter](https://d1.awsstatic.com/builderslibrary/pdfs/timeouts-retries-and-backoff-with-jitter.pdf) | Ambiguous side effects after timeouts, idempotency, and restrained retries. | Backoff is useful for suitable transient failures, not a universal response to any failure. |
| [Andreas Zeller, The Debugging Book: Reducing Failure-Inducing Inputs](https://www.debuggingbook.org/html/DeltaDebugger.html) | Preserving the original failure while simplifying a reproduction. | A reduced trigger is not automatically a causal explanation or globally smallest case. |
| [OpenTelemetry: Signals](https://opentelemetry.io/docs/concepts/signals/) | Selecting evidence from request paths, measurements, and events. | No particular instrumentation product is required. |
| [OpenAI Agents SDK: runtime behavior probe](https://github.com/openai/openai-agents-python/blob/main/.agents/skills/runtime-behavior-probe/SKILL.md) | Validation matrices, controls, held-constant variables, repeat modes, and state controls for comparison or repeat-sensitive probes. | Adapted as a compact conditional aid; its benchmark-specific fields and execution defaults are intentionally not imported. |
| [Jakob Nielsen: 10 Usability Heuristics for User Interface Design](https://www.nngroup.com/articles/ten-usability-heuristics/) | Visible state, recognition of controls, feedback, and recovery inform interface discovery. | Applying design heuristics to agent interaction is this skill's synthesis, not a validated agent protocol from the source. |

The three-probe reassessment checkpoint is inherited practical guidance, not an empirically optimal threshold. The compact probe record, continuation rules, routing, examples, and evaluation rubric are skill-design choices. No source establishes that this combined skill has measured performance gains.
