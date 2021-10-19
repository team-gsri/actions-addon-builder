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

$addonBuilderPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\bohemia interactive\AddonBuilder').path
$addonBuilderExe = "$addonBuilderPath\AddonBuilder.exe"
$includeFilename = "$Source/`$PBOINCLUDE$"
Write-Output "$Includes" | Out-File "$includeFilename"
Write-Output "$addonBuilderExe" "$(Get-Location)/$Source" "$(Get-Location)/$Target" "-include=$includeFilename" $Flags
& "$addonBuilderExe" "$(Get-Location)/$Source" "$(Get-Location)/$Target" "-include=$includeFilename" $Flags