[CmdletBinding(SupportsShouldProcess)]
param(
    [ValidateSet('codex', 'claude', 'both')]
    [string]$Target = 'both',
    [string]$UserRoot = [Environment]::GetFolderPath('UserProfile'),
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$sourceRoot = $PSScriptRoot
$destinations = @()
if ($Target -in @('codex', 'both')) {
    $destinations += Join-Path $UserRoot '.agents/skills/freestyle'
}
if ($Target -in @('claude', 'both')) {
    $destinations += Join-Path $UserRoot '.claude/skills/freestyle'
}

# Explicit package contents exclude the draft, installer, and repository files.
$packageFiles = @('SKILL.md', 'agents/openai.yaml')
$packageFiles += Get-ChildItem -LiteralPath (Join-Path $sourceRoot 'references') -File -Filter '*.md' |
    ForEach-Object { 'references/' + $_.Name }

# Preflight every destination before writing either installation.
foreach ($destination in $destinations) {
    foreach ($relativePath in $packageFiles) {
        $sourcePath = Join-Path $sourceRoot $relativePath
        $destinationPath = Join-Path $destination $relativePath
        if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
            throw "Missing package file: $sourcePath"
        }
        if (Test-Path -LiteralPath $destinationPath) {
            if (-not (Test-Path -LiteralPath $destinationPath -PathType Leaf)) {
                throw "Expected a file: $destinationPath"
            }
            if (-not $Force -and (Get-FileHash -LiteralPath $sourcePath).Hash -ne (Get-FileHash -LiteralPath $destinationPath).Hash) {
                throw "Installed file differs: $destinationPath. Use -Force to update package files."
            }
        }
    }
}

foreach ($destination in $destinations) {
    if ($PSCmdlet.ShouldProcess($destination, 'Install Freestyle skill')) {
        foreach ($relativePath in $packageFiles) {
            $sourcePath = Join-Path $sourceRoot $relativePath
            $destinationPath = Join-Path $destination $relativePath
            New-Item -ItemType Directory -Path (Split-Path -Parent $destinationPath) -Force | Out-Null
            Copy-Item -LiteralPath $sourcePath -Destination $destinationPath -Force
            if ((Get-FileHash -LiteralPath $sourcePath).Hash -ne (Get-FileHash -LiteralPath $destinationPath).Hash) {
                throw "Installed file verification failed: $destinationPath"
            }
        }
        Write-Output "Installed and verified $($packageFiles.Count) files: $destination"
    }
}
