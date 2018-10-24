# pi-hole-server-sync
Bash script that pushes all Pi-hole blacklist and whitelist settings to a secondary server for redundancy

Script assumes 2 servers exist: SERVER1 (containing current configuration) & SERVER2 (secondary server) which have ability to communicate directly over the network. Default port for SSH on SERVER2 is also assumed.

Passwordless SSH login is required between SERVER1 & SERVER2 for the script to work:
 - From SERVER1 run:  ssh-keygen -t rsa
 - From SERVER1 run:  ssh-copy-id user@SERVER2
 - To test from SERVER1 run:  ssh user@SERVER2 

Ideally script should be scheduled as cron job to perform syncronization at regular intervals
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Script must be executed as sudo on SERVER1

sudo ./pi-hole-push-config.sh
