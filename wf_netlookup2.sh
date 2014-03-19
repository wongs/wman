#!/bin/bash

/sbin/ifconfig | grep -v lo |grep Link |
   while read aline
   do
     DEVICE=`echo $aline | awk '{ print $1}'` 
     STATUS=`dmesg | grep $DEVICE | grep send `
     if [ "$STATUS" != "" ];then
       MACADDR=`/sbin/ifconfig $DEVICE | grep $DEVICE |awk '{ print $5 }' `
       #echo $DEVICE $MACADDR
       echo $MACADDR
       fi
 

    done
