#!/bin/sh

# Comment out the next line once things are working, this enables logging
# commands as they are run.
# set -x

#start up the VPN script
#will update this to support other vpn providers later
#sh /config/vpn-configs-contrib/openvpn/protonvpn/ &
#echo "started updating VPN ports"

# The directory to store the two state files - /config is a docker standard
MAMID=$MAM_TORRENT_ID
STATEDIR=/config
CACHEFILE=${STATEDIR}/MAM.ip
COOKIEFILE=${STATEDIR}/MAM.cookie

while true; do

OLDIP=`cat $CACHEFILE`

# Use ip.me to look up the current IP address. The MAM test URL is below in
# case the ip.me option fails.
NEWIP=`curl -s ip4.me/api/ | md5sum - | awk '{print $1}'`
# NEWIP=`curl -s https://www.myanonamouse.net/myip.php | md5sum - | awk '{print $1}'`

# Check to see if the IP address has changed
if [ "${OLDIP}" != "${NEWIP}" ]
then
  echo New IP detected
  # Marker 1 : First run
  curl -s -b "mam_id=$MAMID" -c $COOKIEFILE https://t.myanonamouse.net/json/dynamicSeedbox.php | grep '"Success":true'
  # Marker 2 : Repeat executions
  # curl -s -b $COOKIEFILE -c $COOKIEFILE https://t.myanonamouse.net/json/dynamicSeedbox.php | grep '"Success":true'
  # Marker 3 : End of curl commands

  # If that command worked, and we therefore got the success message
  # from MAM, update the CACHEFILE for the next execution
  if [ $? -eq 0 ]
  then
    echo $NEWIP > $CACHEFILE
  fi
fi
sleep 60
done
