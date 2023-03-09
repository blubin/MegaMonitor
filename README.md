# MegaMonitor
Monitoring facilities for the MegaCli command line tools used by many Dell Servers (PERC/X controllers) among others.

## Description
Many Dell servers use the MegaRAID controller from LSI as part of their PERC/X line of products.  LSI offers a command line tool to interrogate the RIAD controller.  This can be used to determine if errors in the array exist.  However, the tool is not automatically run, and no information is displayed to the user e.g. at login so the user knows to perform maintenance if needed.  This package contains scripts to add this capability.

## Installation
To install the scripts follow these steps:

1. Install the MegaCLI command line tools.  Wikipedia has [instructions](https://wikitech.wikimedia.org/wiki/MegaCli).   By default the package will be installed in `/opt/MegaRAID`.
2. `sudo mkdir /opt/MegaMonitor`
3. `sudo chmod 755 /opt/MegaMonitor`
4. `sudo chown root:root /opt/MegaMonitor`
5. Download `MegaMonitor.sh` and `MegaDisplay.sh` from this repository and place them in `/opt/MegaMonitor`
6. `sudo chmod 755 /opt/MegaMonitor/MegaDisplay.sh`
7. `sudo chmod 744 /opt/MegaMonitor/MegaMonitor.sh`
8. `sudo chown root:root /opt/MegaMonitor/MegaDisplay.sh`
9. `sudo chown root:root /opt/MegaMonitor/MegaMonitor.sh`
10. `sudo crontab -e`.  In the editor that comes up enter `0 6 * * * /opt/MegaMonitor/MegaMonitor.sh`.  This runs the monitor every day at 6am.  Pick a different crontab command if you so choose.

## Monitoring Effect
Following the above installation, the system crontab will run the MegaMonitor.sh script periodically.  This script will interrogate the RAID controller for status, and produce a log file: `/var/log/MegaSAS.log`.  This log will thus be updated each time the crontab runs.

## Command Line Use
Once the installation is complete, any user can execute:

`/opt/MegaMonitor/MegaDisplay.sh`

This will produce a nicely formated display of the status of each harddrive in the array.  If something is wrong, you can then use MegaCli tools to further interrogate the hardware and determine what to do.

## Optional (But kinda the point!): Inclusion in MOTD
It is nice for the MegaDisplay.sh information to automatically be shown upon user login, similar to the other MOTD content.  If you are on Debian or similar, this can be accomplished by adding the `51-raid-display` script to the `/etc/update-motd.d` directory, as follows:

1. Download `51-raid-display` to `/etc/update-motd.d`
2. ` sudo chmod 755 51-raid-display`
3. ` sudo chown root:root: 51-raid-display`

## Todo
Although the scripts are simple to install, it would be nice to turn this into a basic package that could be installed with apt.

