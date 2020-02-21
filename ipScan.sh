#!/bin/bash
fileName=".IPs.list"
if [ "$1" == "" ]
then
    echo "Argument Missing!!!!"
    echo "Syntax: ./ipScan.sh 192.168.0"
else
    echo "Following IP's are online currently:" > $fileName

    for ip in `seq 1 254`
        do
        ping $1.$ip -c 1 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> $fileName &
    done
    size=$(stat -c%s "$fileName")

    if [ $size -ne 37 ]
    then
	cat $fileName
    else
	rm $fileName
	echo "Sorry!!!"
	echo "Nothing found against IP = $1.X"
    fi
fi

#--------------------------------Scripted by Omer Bhatti------------------------------#
