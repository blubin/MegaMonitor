# MegaMonitor
Monitoring facilities for the MegaCli command line tools used by many Dell Servers (PERC/X controllers) among others.

## Description
Many Dell servers use the MegaRAID controller from LSI as part of their PERC/X line of products.  LSI offers a command line tool to interrogate the RIAD controller.  This can be used to determine if errors in the array exist.  However, the tool is not automatically run, and no information is displayed to the user e.g. at login so the user knows to perform maintenance if needed.  This package contains scripts to add this capability.

## Installation
To install the scripts follow these steps:

1. Install the MegaCLI command line tools.  Wikipedia has [instructions](https://wikitech.wikimedia.org/wiki/MegaCli).
2. 
