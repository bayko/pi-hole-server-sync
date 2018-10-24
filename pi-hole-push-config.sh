#! /bin/bash

# Change to Pi-hole config directory
cd /etc/pihole/

# Create temporary location on secondary server for files
ssh user@SERVER2 "mkdir -p /home/user/pihole"

# Push configuration files from primary to temporary location on secondary server
scp  adlists.list *list.txt *.domains user@SERVER2:/home/user/pihole
scp /etc/dnsmasq.d/01-pihole.conf user@SERVER2:/home/user/pihole/01-pihole.conf

# Overwrite existing config files on secondary server with files from temporary location
ssh user@SERVER2 "sudo cp -rf /home/user/pihole/01-pihole.conf /etc/dnsmasq.d; sudo  cp -TRv /home/user/pihole /etc/pihole"

# Remove temporary location on secondary server
ssh user@SERVER2 "sudo rm -r /home/user/pihole"

# Force update Pi-hole on secondary server
ssh user@SERVER2 "pihole -g"