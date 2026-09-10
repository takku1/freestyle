# Worked examples

Illustrative situations, not records of executed tests. Use their decision structure rather than copying commands or assuming identical causes.

## Unfamiliar application: export selected objects

**Request:** Export selected artwork to SVG while retaining the editable document.

**Observation:** The application has Export and Save As actions, but their scope is unknown.

**Question:** Which supported route exports the selection without replacing the working document?

**Probe:** Inspect current selection and the export dialog's format and scope options. If selection export is supported, use it. If only document export is available, inspect another documented route before changing document contents. Canceling a dialog is useful only if it has not already applied changes.

**Verification:** Inspect the actual SVG for expected objects and dimensions; verify the editable document remains available. A dialog closing is insufficient.

**Convergence:** Record the supported selection-export procedure only if reuse is useful. There is no defect requiring a root-cause investigation.

## Tool error mistaken for remote failure

**Request:** Diagnose why a service request fails.

**Observation:** The tool rejects an argument before sending a request.

**Question:** Can the request be constructed using the available schema?

**Probe:** Inspect the tool's argument schema and correct the invocation. A valid target response permits service-level diagnosis; another local validation error remains evidence about invocation.

**Verification:** Establish that the intended endpoint was exercised before interpreting its response. Do not restart or reconfigure the service based on the original tool error.

## Job submission times out

**Request:** Submit one export job and retrieve its output.

**Observation:** Submission timed out after the request may have reached the service.

**Alternatives:** No job was created; a job exists but its acknowledgement was lost; a job completed.

**Probe:** Query the documented operation status or destination using an existing identifier. If pending, poll within a bounded deadline. If completed, retrieve and inspect the output. An empty eventually consistent listing may leave the result inconclusive.

**Next decision:** Retry only after reconciliation establishes safe repetition or documented idempotency covers the request. If neither is possible, report the ambiguous outcome and the information needed. Do not submit repeatedly with new identifiers.

## Configuration appears correct but behavior is wrong

**Request:** Make the local development service use the configured port.

**Observation:** The config file says 8081; the running service responds on 8080.

**Alternatives:** The process has not reloaded; a launch argument overrides the file; the observed listener belongs to another process.

**Probe:** Inspect listener ownership and the intended process's effective launch configuration. If it is the wrong process, find the target. If an override explains the mismatch, change the relevant authorized development configuration. If stale state is supported, use the normal reload procedure.

**Verification:** Check the intended process and its requested operation on 8081. Reading the edited file alone does not verify runtime behavior.

## Intermittent save failure and premature certainty

**Request:** Fix occasional lost saves.

**Observation:** One save succeeds after a restart.

**Learning:** This save worked; the failure's cause and recurrence remain uncertain.

**Probe:** Use a bounded series of disposable documents under relevant conditions, with readback after saves and matched event evidence. If a failure correlates with one condition, design a comparison that distinguishes it from other changes. If the failure cannot be reproduced, state what was tested and the remaining limitation.

**Convergence:** A restoration request may be complete with verified recovery and a limitation. A request to fix recurrence still needs evidence addressing that recurrence or a clear account of the blocker.

## Equivalent retries produce no learning

**Observation:** Three clients receive the same access rejection under the same account and resource.

**Reframe:** Changing clients has not changed the relevant conditions. Inspect the active identity and documented resource permission requirements instead of trying a fourth client.

**Boundary:** If required access is missing, ask for the specific authorized access path or report the blocker. Do not weaken controls or use another identity without authorization.
