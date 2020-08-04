#!/usr/bin/env sh

while true; do

## ENV vars passed by container.
###TOKEN=''
###TEAM_ID=''
###RECOVERY_KEY=''
TEAM=$(curl -s -H "Authorization: token ${TOKEN}" https://api.github.com/teams/${TEAM_ID}/members | grep login | awk '{print $2}' | sed 's/"//g' | sed 's/,//')
KEYS_FILE=/home/core/.ssh/authorized_keys

## Defualts to Core OS, but other OS added here.
if [ -e /home/ubuntu/.ssh/authorized_keys ]
then
  KEYS_FILE=/home/ubuntu/.ssh/authorized_keys
fi

echo "## Recovery Key ##" > $KEYS_FILE
echo $RECOVERY_KEY >> $KEYS_FILE

for member in $TEAM
do
echo ${member}
echo "## ${member} Keys ##" >> $KEYS_FILE
curl -s -H "Authorization: token ${TOKEN}" https://api.github.com/users/${member}/keys | grep key | awk '{$1=""; print $0}' | sed 's/"//g' | sed 's/,//' | sed 's/^[ \t]*//' >> $KEYS_FILE

echo >> $KEYS_FILE

done

sleep 25m

done
