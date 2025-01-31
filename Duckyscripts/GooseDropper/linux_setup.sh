#!/bin/bash

IP=$1
ZIP=$2
PERSIST=$3

#Ensure required arguments are not empty
if [ "${IP}" == "" ] | [ "${ZIP}" == "" ];
then
  echo "Usage: sh linux_setup.sh <IP_Address/URL> <path_to_desktop_goose.zip> <persist y/n>"
  exit
fi

#Check for help command
if [ "${IP,,}" == "-h" ] | [ "${IP,,}" == "help" ];
then
  echo "Usage: sh linux_setup.sh <IP_Address/URL> <path_to_desktop_goose.zip> <persist y/n>"
  exit
fi

#Replace placeholders with provided values
sed -i "s/YOUR_IP/$IP/" GooseDropper.txt
sed -i "s/ZIP/$ZIP/" GooseDropper.txt

#Remove persistance if desired
if [ "${PERSIST,,}" == "n" ];
then
	sed -i "15d;16d;17d;18d;19d" GooseDropper.txt
else
	break
fi
