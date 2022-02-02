#!/bin/bash

if [ "$1" == ""]
then
	echo "Usage: ./pingAll.sh [network]"
	echo "Example: ./pingAll.sh 192.168.0"
else
	for x in `seq 1 254`; do
		ping -c 1 $1.$x | grep "bytes"
done
fi
