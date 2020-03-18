if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$configFile = join-path $pwd start.json
$config = Get-Content $configFile | Out-String | ConvertFrom-Json

push-location $pwd
Set-Location 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'
$config.tasks | ForEach-Object {
    write-host $_.name
    if ($_.type -eq 'lnk') {
        Invoke-Item -Path $_.path
    }
    if ($_.type -eq 'process') {
        Invoke-Expression $_.cmd
    }
}
pop-location
