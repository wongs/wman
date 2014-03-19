#!/bin/bash
#set -xv
# func: scan network, and id the machine
 
# init 1
source /usr/local/bin/wenv.sh

# init 2
SCRIPT=`basename $0`
#echo "date is $DATE"
 
# scan the subnet
for DEV in {1..254}
   do
     IP="$SUBNET.$DEV"
     ping -c 1 -w 1 $IP  > /tmp/null
     RC=$?
     if [ "$RC" = 0 ] ;then
       # use arp to get info, mac address etc
       #arp -a $IP 
 
       # id it
         NAME=`/usr/sbin/arp -a $IP | awk '{ print $1 }'`
         MACADDR=`/usr/sbin/arp -a $IP | awk '{ print $4 }'`
         
         case $NAME in 
         "?" ) 
           NAME=`wf_netlookup1.sh $IP`  
           ;;
          "arp:")
           # own id
           NAME=`hostname`
           MACADDR=`wf_netlookup2.sh`  
           ;;
         *)
           ;;
         esac
           echo "20$DATE $NAME  $IP   $MACADDR "
       fi
   done
