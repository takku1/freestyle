# Probe patterns

Choose the pattern that answers the current question. These are conditional tools, not a checklist to exhaust.

## Capability and interface discovery

For a CLI or API, inspect available tools, local help, version, subcommands, schemas, and supported operations before constructing an invocation. Check required fields and argument types. A method name that sounds plausible is not evidence it exists.

For a GUI, establish the active application, document, selection, mode, and relevant visible controls. Inspect labels, tooltips, menus, accessibility information, and previews where available. Change one local state and observe its result before chaining dependent interactions. Refresh observations after navigation or layout changes; old coordinates and element handles can refer to different controls.

Treat visible affordances as candidate routes. A button named Export does not establish output format or persistence. Preview or inspect options before committing; verify the produced artifact afterward. If the UI lacks feedback, inspect destination state before clicking again.

If documentation reveals a supported procedure, leave discovery and execute it. An alternate tool is useful when it resolves a capability or measurement limitation, not merely because the previous attempt failed.

## Comparison and boundary tests

| Decision | Useful probe | Interpretation limit |
| --- | --- | --- |
| Wrong identity or inadequate access? | Inspect active account, tenant, resource, and relevant permission evidence. | A status code alone may not distinguish them; successful authentication does not grant authorization. |
| Client or service behavior? | Send an equivalent minimal request through another available client. | Match identity, endpoint, payload, headers, and relevant network path; otherwise differences are confounded. |
| Intended or effective configuration? | Inspect the running process's active value and source. | A file edit does not prove reload; a shell's environment may differ from a service's. |
| Component or dependency? | Observe input and output at their participating boundary. | A generic health check may bypass the failing operation. |
| Original failure or measurement failure? | Try a known-good control using the same observation path. | A control validates only the exercised portion of that path. |
| Local symptom or widespread condition? | Compare matched failing and unaffected targets in the relevant window. | Different versions, load, or regions may explain the comparison. |

For a pipeline, map only the stages involved in the failing path. Locate the last boundary with verified expected output and the first unexpected one. Probe between them if the intermediate result is observable and meaningful. Do not assume binary search applies when branches, feedback, or multiple failures break the ordering.

## Minimal reproduction and reduction

Define what counts as the **same failure** before reducing inputs, configuration, steps, or changes. Keep a known failing baseline. Remove a portion, check whether the original failure survives, and retain useful reductions. Distinguish reproduction from a new syntax error or missing dependency. An inconclusive run is neither passing nor failing evidence.

Reduce in an isolated copy when possible. Interaction between inputs can prevent simple halving from finding the smallest example. A reduced case helps localize conditions; it does not by itself prove the causal mechanism or a globally minimal trigger. These techniques adapt [The Debugging Book](https://www.debuggingbook.org/html/DeltaDebugger.html).

## Ambiguous completion, retries, and polling

A timeout after submission leaves completion unknown. Before retrying a state-changing operation, inspect authoritative status, the destination resource, or an operation identifier. Reuse an idempotency key only according to the service's documented semantics. A new key may create a new operation.

If reconciliation is unavailable and duplication matters, stop that branch with the ambiguity intact. Do not infer safe repetition from an error message.

For justified transient retries, honor service guidance and choose a bounded attempt count or deadline. Account for retries already performed by the client; avoid multiplying retries across layers. Backoff and jitter reduce synchronized retry pressure but cannot fix invalid input or missing permission. These rules draw on [Amazon's retry guidance](https://d1.awsstatic.com/builderslibrary/pdfs/timeouts-retries-and-backoff-with-jitter.pdf).

Polling observes an existing operation; retrying may start another. Poll a specific status with a terminal condition and deadline. A queue acknowledgement establishes acceptance, not completed work. On deadline, report the last observed state and pending operation identifier where appropriate.

## Intermittent or timing-dependent behavior

Decide what repetitions would teach before repeating. Bound sample count, time, and load. Record conditions and success/failure counts; compare like with like. Separate cold from warm state, fresh from cached reads, and affected from unaffected versions when relevant.

Do not turn one clean run into "fixed," or several unrepresentative runs into a numerical reliability claim. If instrumentation changes timing, label that limitation and prefer less intrusive observations where available.

## Mutation and recovery

Before an experimental mutation, know the previous relevant state, expected effect, verification path, and feasible recovery. Use a disposable copy or narrowly scoped target when it answers the same question. "Undo available" does not reverse notifications, external jobs, or consumed data.

Afterward, inspect the result and any material residual effects. Restore your temporary changes when appropriate without overwriting concurrent changes. Preserve a successful requested change; cleanup is not a reason to undo the user's result.
