#!/bin/bash

# Coyright: Rubens Rainelli
# Use at YOUR OWN RISK since it clear ALL LOGS and you could miss some really important log.
# I suggest to NEVER use it before a reboot if you just made an important upgrade or you're not sure what you're removing.
# I suggest to launch it before reboot, only if you just completed a reboot succesfully.

# HOWTO use this script:
# Place in your favorite folder, I suggest /root/scripts since only root should be allowed to use this one.
# $ chmod +x loglcelaner.sh
# $ sudo /root/scripts/logcleaner.sh

# Log Dicrectory
log_dir="/var/log"

# Remove .gz files and fioles that end in .X (where X is a number)
find "$log_dir" -type f \( -name '*.gz' -o -name '*.x[0-9]' \) -exec rm -f {} \;

# Clear ALL other files by emptiing them
find "$log_dir" -type f -exec sh -c '> "$1"' _ {} \;

echo "Operation Complete: file .gz and .[0-9] removed, other files emptied."
