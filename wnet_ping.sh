#!/bin/bash
# format wnetping.sh ip_addr

# set variable
source /usr/local/bin/wenv.sh
   
  
# device list
WEBCAM_IP=$1
STATUS="/tmp/$WEBCAM_IP.status"

echo " $DATE - ping test ok for $WEBCAM_IP  "  
/bin/ping -c 3  $WEBCAM_IP  >  /dev/null

RES1=`echo $?`
 
# if network not accessable
if [  "$RES1" -ne  0 ]
   then
     echo " $DATE $WEBCAM network not working, take action "  
    if [ -f "$STATUS" ]; then 
        echo " $DATE message already send $WEBCAM_IP"
     else
        touch $STATUS
        echo "send $WEBCAM_IP down msg to $SENDTO"
        wsend_gmail.py  $SENDTO $GMAIL_PASSWD $SENDTO "DOWN_$WEBCAM_IP"

       fi
     else
     rm $STATUS

 fi
