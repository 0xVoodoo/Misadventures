======= Goose Dropper ========
This is a duckyscript originally designed for Flipper-Zero to drop Desktop Goose on a Windows PC.

Currently there is no auto-configurator for Windows but it's in the works. Steps to configure manually:
    1) Replace the YOUR_IP value in GooseDropper.txt with your IP
    2) Download Desktop Goose and extract it, rename the DesktopGoose v.031 from inside the zip to Update
    3) Re-ZIP the Update directory and name it Chrome_Updater.txt
    4) Start some form of simple webserver/fileshare on port 1337
    5) Copy to your Flipper or Rubber-Ducky and PWN!

Important Notes:
Ensure configuration is run while on the same network as your target, re-configure with each new network.

Currently a reboot will kill the process, however persistance is being worked on.

All credit goes to Samperson for the development of Desktop Goose: https://itch.io/profile/samperson | https://twitter.com/samnchiet
