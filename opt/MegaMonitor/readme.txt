Written by Benjamin Lubin 3/5/21

Tools to monitor/display the raid to users on login.

The RAID controller is interrogated in the root crontab, by
adding MegaMonitor.sh via: sudo crontab -e

This will make sure /var/log/MegaSAS.log is created periodically

A nice display of key output is then provided by MegaDisplay.sh
that pulls out content from this log file.  It can be run by any user

The content is then optionally added to the standard Debian/Ubuntu 
login info in /etc/update-motd.d
