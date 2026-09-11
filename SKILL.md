---
name: freestyle
description: Discover a workable route to a clear objective through evidence-driven interaction with an unfamiliar system, interface, environment, or unexpected behavior. Use when the next action depends on an unverified explanation or unknown capability. Do not use for ordinary execution when a reliable procedure is known, cheaply retrievable, or supplied by another skill.
---

# Freestyle

Discover the route while solving the problem.

**Optimize for information and verified progress, not activity.**

## Rules

- **Observation != interpretation.** What happened is evidence; why it happened is a hypothesis.
- **Execution != success.** Verify the intended effect on the intended target.
- **Prior effort != evidence.** Drop hypotheses the evidence stops supporting.
- **Conclusion strength <= evidence strength.** Distinguish observed fact, supported inference, working hypothesis, and unresolved possibility.
- **Method freedom != authority expansion.** Permissions, safety, scope, and approvals remain binding.

## Entry and working agreement

Enter when an expected procedure behaves unexpectedly, several plausible explanations imply different next actions, an unfamiliar capability must be discovered, or failure tempts an equivalent retry without new evidence. A system need not be broken: discovering a supported export path in an unfamiliar application also qualifies.

Establish the requested outcome and an observable completion condition. Identify the relevant target, environment, and constraints from available context. Ask only for missing information that materially changes the work; do not reopen settled choices or approvals. If the objective itself is unclear, clarify it rather than inventing one.

Retrieve a reliable procedure when that is cheaper than discovery. Apply a domain skill's known procedures when available; use Freestyle for the unresolved part, then return to execution. Do not make every task an investigation.

Use the loop internally. Share concise findings, consequential decisions, and remaining uncertainty, not a transcript of deliberation or mandatory forms.

### Reference routing

Load [references/probe-patterns.md](references/probe-patterns.md) when choosing or bounding a test for an unfamiliar control, tool, interface, layered system, retry, or intermittent failure. Load [references/research-and-evidence.md](references/research-and-evidence.md) when evidence is noisy, external, ambiguous, or being used to support a causal claim. If a reference is unavailable, continue with the core guidance, note the limitation when material, and do not treat the loading failure as evidence about the target.

## Loop

`inspect -> frame -> hypothesize -> discriminate -> probe -> verify -> update`

When diagnosis is unnecessary and the next action is obvious, low-impact, reversible, and directly verifiable, use `inspect -> act -> check`.

The fast path applies to one obvious action with a low-impact, reversible effect and a direct check. Check the intended effect on the intended target independently of any success message. Bail out to the full loop if the check fails or the result surfaces a competing explanation; do not use it for actions that materially alter shared state, destroy evidence, or complicate recovery.

### 1. Inspect

Establish actual behavior before changing it. Start with the cheapest reliable evidence: exact output, current state, local help, capabilities, documentation, effective configuration, logs, relevant changes, or a small reproduction.

Confirm that evidence belongs to the intended version, identity, workspace, resource, and time window. Inspect only the relevant configuration; avoid dumping credentials or unrelated private data. Preserve exact error text and useful identifiers in appropriate local artifacts when needed.

**Inspection is not automatically non-invasive.** Reading a queue may consume a message; opening a page may mark an item read; reproduction may create a job. Check likely effects before treating an operation as observation.

For an active consequential failure, prioritize authorized stabilization and preserve diagnostic evidence where practical. Do not delay urgent mitigation solely to obtain a perfect diagnosis. Record when mitigation changes the conditions being investigated.

Use the reference routing above when the evidence source or probe design warrants it.

### 2. Frame

Ask: **What do I need to learn next for the next decision to become obvious?**

Frame defines the question; hypothesize proposes answers.

Define the gap between expected and observed behavior, or the missing capability between current state and the objective. Separate the observation from its explanation. Narrow to the smallest relevant boundary without assuming the defect must be inside it.

Choose the immediate purpose: discover capability, distinguish causes, restore service, or verify an outcome. A successful workaround can satisfy restoration without establishing root cause.

### 3. Hypothesize

Generate a small set of plausible explanations from the system's causal neighborhood:

- Preconditions needed for the expected behavior.
- Participating inputs, components, dependencies, and boundaries.
- Relevant changes and known failure modes.
- Unverified assumptions, including the measurement or tool itself.

Ask: **What would have to be true for this observation to make sense?**

Rank candidates qualitatively by fit to current evidence first, then by the cost of a discriminating probe, then by the cost of being wrong. Do not invent probabilities. Note contradictory evidence and what would disconfirm the leading explanation. Keep alternatives that the evidence has not separated; allow multiple contributing causes when observations require them.

For capability discovery, candidates may be possible supported routes rather than failure causes. Do not manufacture a root-cause problem to fit the loop.

### 4. Discriminate

Choose a probe whose plausible outcomes change the next decision. Prefer useful separation of leading alternatives or direct verified progress over collecting more of the same evidence.

For a meaningful probe, retain a compact prediction:

```text
Question / competing explanations:
Probe and target:
Expected outcomes -> next decision:
Inconclusive if:
```

Add a time or attempt limit and recovery plan when the probe's cost or effects warrant them.

This template is a thinking aid, not required user-facing paperwork.

Examples: verify active identity to separate identity from permissions; compare equivalent requests across clients; inspect runtime values to separate intended from effective configuration; test a participating boundary to narrow a pipeline.

If every plausible result leads to the same action, skip the probe unless it independently verifies completion or a necessary precondition.

### 5. Probe

Use the lowest-burden test with sufficient diagnostic value. Prefer narrow, reversible, local, observable operations. Consider information gained alongside time, cost, side effects, scope, and recovery; read-only is a preference, not a guarantee of safety.

When causality matters, change one meaningful variable at a time. If several variables must change together, limit the conclusion accordingly. Preserve the baseline and isolate temporary mutations when practical; restore only changes you own, accounting for concurrent work.

Parallelize probes only when mutable state, ordering, resource contention, shared evidence, interpretation, read-side rate limits, and resource locks cannot cause interference. This permits independent tool calls; it does not require agent delegation.

An ambiguous timeout does not establish that an action failed to take effect. Reconcile outcome before repeating a consequential operation. Use bounded polling or retries only when supported by the operation's semantics and a reason to expect new evidence.

### 6. Verify and update

First establish whether the probe executed correctly and reached its intended target.

`probe failure -> evidence about the probe/tool`

`target response -> evidence about the target`

`target not observed -> evidence about the observation path or target state`

Do not diagnose a remote service from a local parse error, tool schema rejection, or unavailable capability. Transport failures may narrow a boundary without identifying the component at fault.

Treat probe failure, target response, and target not observed as distinct outcomes. A missing response or telemetry record does not establish that the target did not act unless the observation path was expected to capture it.

Then compare the observation against the prediction. Classify the result as supporting, contradicting, or inconclusive. One successful attempt does not establish reliability for intermittent behavior.

Verify against the original completion condition, preferably through an observation independent of the action's success message: inspect the saved artifact, read back the correct resource, or exercise the affected user path. Match verification depth to consequence; do not broaden testing without a reason.

Retain only decision-relevant state:

```text
Observed:
Learned / ruled out (within which conditions):
Still unknown:
Next:
```

The reference routing above covers noisy evidence, ambiguous outcomes, and causal claims.

This state block is a thinking aid, not required user-facing paperwork.

## Stall, budget, and reframe

Exploration must continue earning its cost. Reassess after **three consecutive probes without decision-relevant information or verified progress**, or earlier when a probe is expensive, slow, risky, or hard to reverse. Ruling out a hypothesis counts as useful information and progress. Three is a practical checkpoint, not a scientific threshold or permission for three risky attempts.

Count equivalent attempts together even when commands, tools, or wording differ. Repetition is justified only when conditions, inputs, hypothesis, or information sought change. Deliberate repeated sampling of intermittent behavior is valid when bounded and informative.

On reassessment, choose deliberately:

- **Continue** when evidence supports a useful next probe within the task's limits.
- **Reframe** the hypothesis, boundary, decomposition, evidence source, or strategy.
- **Escalate** for unavailable authority, essential information, resources, or expertise.
- **Stop the blocked branch** when no justified next action remains; complete independent authorized work where useful.

Return to the last reliable observations. Inspect effective state, isolate a component, construct a smaller reproduction, or test a materially different explanation. Do not polish a dead end. Do not declare the objective impossible merely because one tool or route failed.

Use explicit user budgets when supplied. Otherwise scale effort to task value and probe cost; do not invent a long research phase, unlimited retry policy, or arbitrary fixed investigation duration.

## Continuity and escalation

For long investigations, compress current findings when changing subproblems or when exploratory details begin repeating:

```text
Knowledge Baseline
Objective / completion condition:
Target / relevant version and context:
Established (evidence locations):
Ruled out (scope of exclusion):
Working model / unresolved alternatives:
Changes made / pending operations / recovery:
Open / blocked by:
Next discriminating action:
```

This baseline is a thinking aid, not required user-facing paperwork.

Persist this only when continuity requires it and storage is available. Keep secrets out; link appropriate evidence instead of copying entire logs. On resumption, revalidate volatile state before acting. Drop superseded detail unless it remains diagnostically relevant.

Ask for the smallest missing decision or information when the user is the cheapest reliable source. Continue within existing authorization; ask again only when a new required decision or boundary arises. Never treat missing authority as a technical obstacle to bypass.

If blocked, report what is established, the specific blocker, what is needed, and the safest useful next action. Distinguish missing access from missing knowledge and an untested route from an infeasible objective.

## Converge

Freestyle exists to make itself unnecessary.

Stop exploring when the objective is verified, a workable procedure applies, or remaining uncertainty would not change the next action. Complete the authorized execution; discovering a route alone is not completion of a request to perform the work.

Preserve a reusable procedure only when it has future value:

```text
Preconditions:
Procedure:
Verification:
Important failure/recovery conditions:
Known limits / unresolved cause, if relevant:
```

This procedure is a thinking aid, not required user-facing paperwork.

Report the outcome, decisive verification, and material remaining uncertainty. Describe mitigation as mitigation and an unverified result as unverified.

**Re-enter Freestyle when new evidence invalidates the procedure, its preconditions, or the working model.** Resume from that observation instead of blindly retrying.

## Anti-patterns

- Repeating an equivalent attempt without changing the conditions, hypothesis, or information sought.
- Diagnosing a remote target from a local parse error, schema rejection, or unavailable capability.
- Declaring the objective impossible because one tool, route, or probe failed.
- Treating a success message, dialog change, or completed command as proof that the intended target changed.
- Polishing a dead end instead of reframing the boundary, evidence source, or strategy.

## Supporting material

These reference paths are relative to this `SKILL.md` and must resolve within the installed skill directory.

- [Probe patterns](references/probe-patterns.md): choose and bound a test for unfamiliar tools, interfaces, layered systems, retries, or intermittent failures.
- [Research and evidence](references/research-and-evidence.md): use external resources and interpret uncertain observations.
- [Worked examples](references/worked-examples.md): consult when applying the loop to capability discovery or tricky failure boundaries.
- [Evaluation scenarios](references/evaluation-scenarios.md): use when maintaining or behaviorally evaluating this skill, not during ordinary execution.
- [Sources](references/sources.md): provenance and limits of the research-informed additions; no need to load during normal use.

Freestyle changes the route to an objective, not its authorization. "Find another way" never authorizes bypassing restrictions, weakening controls, concealing actions, or expanding scope.
