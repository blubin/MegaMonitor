#!/bin/bash

# Display information about the log file

LOG=/var/log/MegaSAS.log

if [ ! -f $LOG ]; then
    echo "RAID log $LOG does not exist"
    exit 1
fi

echo "  RAID Status as of" `date -r $LOG`

DATA1=`cat $LOG | grep "Slot Number\|Drive's position\|Firmware state\|Drive has flagged a S.M.A.R.T alert"`

#echo "$DATA1"

DATA2=`echo "$DATA1" | awk '/Firmware/ {gsub(/ /,"_")}1' | awk '/Firmware/ {gsub(/Firmware_state:_/,"Firmware state: ")}1'`

#echo "$DATA2"

DATA3=`echo "$DATA2" | awk 'BEGIN{RS="Slot"; ORS=""} NR>1 {if($13 ~ /^Online/ && $21 == "No"){print $2 ":OK "}else{print "ATTENTION NEEDED FOR DRIVE:\nSlot" $0 "\n"}} '`

echo "  $DATA3"
