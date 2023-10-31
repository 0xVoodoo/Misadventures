**======= Goose Dropper v2.0 ========**

This is a duckyscript originally designed for Flipper-Zero to drop Desktop Goose (by Samperson) on a Windows PC. **NOW WITH PERSISTENCE**

------------------------------------------------------------------------------------------------------

Currently there is no auto-configurator for Windows but it's in the works. Steps to configure manually:
    
    1) Replace the YOUR_IP value in GooseDropper.txt with your IP.
    
    2) Download Desktop Goose and extract it, rename the 'DesktopGoose v.031' folder from inside the zip to Update.

    3) Copy PersistentGoose.ps1 into the newly renamed Update folder.
   
    4) Re-ZIP the Update directory and name it Chrome_Updater.txt.
    
    5) Start some form of simple webserver/fileshare on port 1337 (or change the port to reflect your choice).
    
    6) Copy to your Flipper or Rubber-Ducky and PWN!

--------------------------------------------------------------------------------------------------------------

**Important Notes:**

Ensure configuration is run while on the same network as your target, re-configure with each new network, unless the download location provided is publicly accessible.

All credit goes to Samperson for the development of Desktop Goose: https://itch.io/profile/samperson | https://twitter.com/samnchiet

**=== v2.0 Notes ==**
    Added persistence via a PowerShell script that makes a shortcut in the startup folder.
    Revamped updater with more options and better dialogue. 
    Bugfixes to ensure payloads get delivered successfully.
