

#!/bin/bash



# Set the new memory limit

NEW_MEMORY_LIMIT=${NEW_MEMORY_LIMIT}



# Edit the configuration file to set the new memory limit

sed -i "s|^-Xmx.*| -Xmx${NEW_MEMORY_LIMIT}m|" /etc/systemd/system.conf



# Restart the systemd daemon to apply the changes

systemctl daemon-reload



# Restart the server to apply the new memory limit

reboot





sudo ./increase_memory.sh