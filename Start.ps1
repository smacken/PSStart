if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

cd 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'

# visual studio
. '.\Visual Studio 2019.lnk'

# outlook
. .\Outlook.lnk

# explorer
explorer C:\dev\src

# slack
cd 'C:\Users\Scott.Mackenzie\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Slack Technologies'
. .\Slack.lnk

# conemu
push-location $pwd
cd 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ConEmu\'
. '.\ConEmu (x64).lnk'
pop-location 

Start-Process "chrome.exe"