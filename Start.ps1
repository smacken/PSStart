# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$configFile = join-path $pwd start.json
$config = Get-Content $configFile | Out-String | ConvertFrom-Json

function RunLink ($path){
    Invoke-Item -Path $path
}

push-location $pwd
cd 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'
$config.tasks | foreach {
    write-host $_.name
    if ($_.type -eq 'lnk') {
        RunLink($_.path)
    }
    if ($_.type -eq 'process') {
        iex $_.cmd
    }
}
pop-location
