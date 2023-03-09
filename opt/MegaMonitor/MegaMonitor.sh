#!/bin/bash

#This file inserted into the crontab to run 1x a day

#It will then ensure that a log of the activity of the Raid
# is available in in the /var/log/MegaSAS.log file
# this can then be interogated on login by MegaDisplay.sh running
# at user privlage.

if [[ $EUID -ne 0 ]]; then
    echo "Cannot execute MegaMonitor.sh, must be root."
    exit 1
fi

# Run the MegaRaid utility to capture the data, which has a side effect
# of creating the log file /var/log/MegaSAS.log
cd /var/log
rm MegaSAS.log
/opt/MegaRAID/MegaCli/MegaCli64 -LDPDInfo -aAll
