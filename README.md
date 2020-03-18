# PSStart
Powershell start script

After you restart your computer there are usually a bunch of programs you want to run to get started.

Simply configure program tasks to run.

Example startup task:
Link
```json
    {
        "name": "Visual Studio",
        "type": "lnk",
        "path": ".\\Visual Studio 2019.lnk"
    }
```

Command
```json
    {
        "name": "Chrome",
        "type": "process",
        "cmd": "Start-Process chrome.exe"
    }
```