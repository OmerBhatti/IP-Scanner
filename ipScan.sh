#!/bin/bash

if [ "$1" == "" ]
then
    echo "Argument Missing!!!!"
    echo "Syntax: ./ipScan.sh 192.168.0"
else
    echo "Following IP's are online currently:" > .ips.list

    for ip in `seq 1 254`
        do
        ping $1.$ip -c 1 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> .ips.list &
    done
    size=$(stat -c%s ".ips.list")

    if [ $size -ne 37 ]
    then
	cat .ips.list
    else
	rm .ips.list
	echo "Sorry!!!"
	echo "Nothing found against IP = $1.X"
    fi
fi

#--------------------------------Scripted by Omer Bhatti------------------------------#
