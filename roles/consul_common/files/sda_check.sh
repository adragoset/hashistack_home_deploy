#!/bin/sh
 
message=$(df -k 2>/dev/null | sed -n -e '/overlay/p')
diskusage=$(df -k 2>/dev/null | sed -n -e '/overlay/p' | awk '{print $5}' | sed 's/[^0-9]*//g' |  awk '{printf "%d", $0*1}')
 
echo $message
echo "Disk usage is roughly $diskusage%"
 
if [ $diskusage -gt "98" ]; then
	echo "Critical state"
	exit 2
elif [ $diskusage -gt "80" ]; then
	echo "Warning state"
	exit 1
else
    echo "Nominal state"
	exit 0
fi