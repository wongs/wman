#!/bin/sh
set -xv
# format wnetping.sh ip_addr

# set variable
source /usr/local/bin/wenv.sh
   
  
# device list
WEBCAM_IP=$1
STATUS="/tmp/$WEBCAM_IP.status"

echo " basic test for $WEBCAM_IP  "  
/bin/ping -c 1 -w 1  $WEBCAM_IP  >  /dev/null

RES1=`echo $?`
 
# if network not accessable
if [  "$RES1" -ne  0 ]
   then
     echo " $DATE $WEBCAM network not working, take action "  
    if [ -f "$STATUS" ]; then 
        echo " $DATE message already send $WEBCAM_IP"
     else
        touch $STATUS
        echo "send message regarding $WEBCAM_Ip"
        wsend_gmail.py   koodoman21@gmail.com aixtools koodoman22@gmail.com "DOWN_$WEBCAM_IP"

       fi
     else
     echo   "$DATE $WEBCAM_IP is alive" 
     rm $STATUS

 fi
