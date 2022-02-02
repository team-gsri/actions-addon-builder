[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $Source,

    [Parameter()]
    [string]
    $Target,

    [Parameter()]
    [string]
    $Includes,

    [Parameter()]
    [string[]]
    $Flags = @{}
)

$pboIncludeFilename = '$PBOINCLUDE$'
$addonBuilderPath = "$env:ARMA3TOOLS\AddonBuilder"
$addonBuilderExe = "$addonBuilderPath\AddonBuilder.exe"
$includeFilename = "$env:GITHUB_WORKSPACE\$Source\$pboIncludeFilename"
Write-Output "$Includes" | Out-File "$includeFilename"
& "$addonBuilderExe" "$env:GITHUB_WORKSPACE\$Source" "$env:GITHUB_WORKSPACE\$Target" "-toolsDirectory=$env:ARMA3TOOLS" "-include=$includeFilename" $Flags
