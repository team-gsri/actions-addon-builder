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
$addonBuilderPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\bohemia interactive\AddonBuilder').path
$addonBuilderExe = "$addonBuilderPath\AddonBuilder.exe"
$includeFilename = "$env:GITHUB_WORKSPACE/$Source/$pboIncludeFilename"
Write-Output "$Includes" | Out-File "$includeFilename"
& 'C:\Program Files (x86)\Steam\steam.exe' ; Start-Sleep -Seconds 5
& "$addonBuilderExe" "$env:GITHUB_WORKSPACE/$Source" "$env:GITHUB_WORKSPACE/$Target" "-include=$includeFilename" $Flags