---

name: freestyle
description: Use when the objective is clear but the method or cause is unknown and must be discovered through interaction with an unfamiliar system, interface, environment, or behavior. Do NOT use when a reliable procedure is known, cheaply retrievable, or supplied by another skill.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Freestyle

Discover the route while solving the problem.

**Optimize for information and verified progress, not activity.**

## Rules

* **Observation != interpretation.** What happened is evidence; why it happened is a hypothesis.
* **Execution != success.** Verify the intended effect.
* **Prior effort != evidence.** Keep explanations only while evidence supports them.
* **Method freedom != authority expansion.** Permissions, safety, scope, and approvals remain binding.

## Entry

Use the full Freestyle loop **as soon as the next action depends on an unverified explanation of unfamiliar behavior**.

Typical signals:

* an expected procedure behaves unexpectedly;
* the next step requires guessing why something happened;
* multiple plausible causes would imply different actions;
* a failed action tempts a semantically equivalent retry without new evidence.

If the method is already known and the problem is ordinary execution, do not activate Freestyle.

## Loop

Use:

`inspect -> frame -> hypothesize -> discriminate -> probe -> verify -> update`

When diagnosis is unnecessary and the next action is obvious, low-impact, reversible, and directly verifiable, use:

`inspect -> act -> check`

The check must confirm the intended effect before continuing.

Do not use the fast path to explain an unknown cause, resolve competing hypotheses, or perform an action that could materially alter shared state, destroy evidence, create meaningful side effects, or complicate recovery.

Use the reasoning internally unless communicating it is useful.

### 1. Inspect

Establish what is actually happening before changing it.

Use the cheapest reliable evidence available, including:

* errors, output, and effective state;
* help, documentation, schemas, capabilities, or metadata;
* logs, traces, telemetry, and recent relevant changes;
* existing user knowledge or a cheap clarifying question;
* reproduction, when useful.

Prefer asking a focused question when the answer could eliminate substantial exploration.

**Inspection is not automatically non-invasive.** Consider whether observing or reproducing could consume, acknowledge, lock, trigger, rate-limit, advance, cache, or otherwise alter relevant state.

For consequential failures, stabilize the situation and preserve transient or diagnostic evidence before altering it.

Retrieve a reliable procedure instead of rediscovering it when retrieval is easier.

### 2. Frame

Ask:

**What do I need to learn next for the next decision to become obvious?**

Define the gap between expected and observed behavior. Separate evidence from explanation.

Do not solve a broader problem than necessary.

### 3. Hypothesize

Generate a small set of plausible causes from the system's **causal neighborhood**:

* what conditions must be true for the expected behavior;
* what components, dependencies, inputs, or boundaries directly participate;
* what changed;
* what failure modes commonly produce the observation;
* what assumptions remain unverified.

Ask:

**What would have to be true for this observation to make sense?**

Rank candidates using available evidence, system knowledge, known failure frequency, and relevant recent changes. Do not invent confidence.

Actively note evidence that contradicts leading candidates. Do not keep a hypothesis merely because it is plausible.

### 4. Discriminate

Choose an observation that efficiently separates the most plausible remaining causes.

Before each meaningful probe, retain:

```text
Expected:
If observed:
Then:
```

If plausible outcomes would not change the next decision, skip the probe.

Useful patterns:

`authn vs authz -> test authenticated identity`
`client vs server -> use an independent client`
`component vs dependency -> test their boundary`
`config vs runtime -> inspect effective configuration`
`large pipeline -> test near the midpoint and narrow`

### 5. Probe

Use the lowest-burden test with sufficient diagnostic value.

Prefer:

`read-only -> mutating`
`narrow -> broad`
`reversible -> irreversible`
`local -> system-wide`
`observable -> ambiguous`

These are preferences, not guarantees. A nominally read-only action may still have side effects.

Consider time, cost, side effects, scope, risk, reversibility, and information gained.

Common probes:

* unfamiliar command -> inspect help, version, subcommands, syntax;
* API failure -> inspect response, auth state, permissions, minimal request;
* config issue -> inspect effective configuration before editing;
* runtime failure -> inspect logs, dependencies, traces, or state;
* suspected dependency -> test it independently;
* complex behavior -> reduce to a minimal reproduction;
* layered system -> bisect across component boundaries;
* unclear capability -> enumerate supported capabilities first.

When causality matters, change one meaningful variable at a time.

Parallelize only when probes cannot interfere through mutable state, shared evidence, ordering, resource contention, or interpretation. Otherwise probe sequentially.

### 6. Verify and Update

First determine whether the probe executed correctly and reached the intended target.

`probe failure -> evidence about the probe/tool`
`target response -> evidence about the target`

Do not diagnose the target from malformed inputs, local/tool failures, unavailable capabilities, or failures that occurred before the target was exercised.

Then compare the result with the expected outcome and verify the intended consequence when practical.

A result may support a hypothesis without proving it. Preserve alternatives the evidence did not distinguish.

Retain only:

```text
Observed:
Learned / ruled out:
Still unknown:
Next:
```

Do not maintain a running diary.

For long investigations, compress stable findings into:

```text
Knowledge Baseline
Objective:
Established:
Ruled out:
Working model:
Open:
Next:
```

Recompress when changing subproblems, findings begin repeating, or accumulated exploratory state becomes difficult to reason over.

Once captured in the baseline, stop carrying superseded exploratory detail forward unless it remains diagnostically relevant.

Persist the baseline when it must survive the current context and persistent storage is available.

## Stall, Budget, and Reframe

Exploration must continue earning its cost.

Reassess when:

* **3 consecutive probes** produce no useful information or verified progress, **or sooner when a probe is costly, slow, risky, or difficult to reverse**;
* scope, cost, or risk grows faster than diagnostic value;
* progress increasingly depends on speculation.

Then:

* **continue** if evidence justifies further investigation;
* **reframe** by changing the hypothesis, boundary, decomposition, evidence source, capability, or strategy;
* **escalate** when required authority, information, expertise, resources, or risk acceptance is unavailable;
* **stop** when the objective appears infeasible or no longer justifies further exploration.

When stalled, return to the last reliable observations. Isolate components, test boundaries, inspect effective rather than intended state, build a minimal reproduction, or pursue a materially different explanation.

Do not repeat a probe unless the hypothesis, conditions, inputs, or information sought changed.

**Do not polish a dead end.**

## Escalate

Escalate instead of improvising when progress requires unavailable authorization, information, resources, expertise, clarification, or acceptance of consequential risk.

Ask the user for the smallest missing decision or information when they are the cheapest reliable source.

Otherwise stop safely with:

```text
Established:
Blocked by:
Needed:
Safest next action:
```

Never convert missing authority into a technical obstacle to bypass.

## Converge

Freestyle exists to make itself unnecessary.

Stop exploring when the route is repeatable, the cause is understood well enough to proceed, remaining uncertainty would not change the action, or an established procedure now applies.

Preserve only:

```text
Preconditions:
Procedure:
Verification:
Important failure/recovery conditions:
```

Then use the appropriate domain skill or normal execution path.

**Re-enter Freestyle if execution produces new evidence that invalidates the procedure, its preconditions, or the causal model behind it.** Resume from the new observation rather than blindly retrying the failed procedure.

## Boundaries

Freestyle changes **how** the objective is pursued, never **what is authorized**.

Permissions, approvals, safety requirements, user intent, and scope remain binding. "Find another way" never means bypassing a restriction, weakening controls, concealing actions, evading authorization, or expanding scope.
