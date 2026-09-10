# Freestyle

Discover the route while solving the problem. An evidence-driven skill for clear objectives with unfamiliar methods or unexpected behavior. Read [SKILL.md](SKILL.md) for the workflow.

## Install

From this checkout in PowerShell, install for both Codex and Claude Code:

```powershell
.\install.ps1
```

Or select one:

```powershell
.\install.ps1 -Target codex
.\install.ps1 -Target claude
```

From another directory, use the full script path, for example:

```powershell
& 'Z:\freestyle\install.ps1' -Target both
```

The installer copies the skill, references, and Codex UI metadata to personal skill folders and verifies file hashes. It needs permission to write those folders. It does not install the original draft or change application configuration.

| Application | Destination | Invoke |
| --- | --- | --- |
| Codex | `~/.agents/skills/freestyle` | `$freestyle` |
| Claude Code | `~/.claude/skills/freestyle` | `/freestyle` |

These locations follow the official [Codex skill documentation](https://learn.chatgpt.com/docs/build-skills) and [Claude Code skill documentation](https://code.claude.com/docs/en/skills). This installs locally for Claude Code, not Claude web or Cowork.

Freestyle should be available on your next Codex turn. If it is not listed, start a new session. In Claude Code, check `/skills`; restart if its top-level skills directory was created during the current session.

## Update and preview

Re-running with identical files is safe. Existing differing package files require an explicit update:

```powershell
.\install.ps1 -Target both -Force
```

`-Force` overwrites matching package filenames; it does not delete extra files. Preview destinations without writing:

```powershell
.\install.ps1 -WhatIf
```

For an isolated installation check, `-UserRoot <directory>` places both application folders beneath that directory instead of your user profile. The installer requires Windows PowerShell 5.1 or PowerShell 7; no downloads or additional dependencies are needed.
