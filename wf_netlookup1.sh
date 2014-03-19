#!/bin/bash
#set -xv
# func: lOOK FOR HOSTNAME, input server ip

SERVER=$1

if [ "$SERVER" = "" ];then
    echo " parm needed, exiting now"
    fi
 
# init
TMPDIR="/tmp"
ANS=""
 
 # netbois check 
 ANS=`nmblookup  -A $SERVER|grep \<00|head -1|awk '{ print $1}' `
 if [ "$ANS" != "" ];then
   echo  $ANS
   fi

 # nmap scan
 if [ "$ANS" = "" ];then
   ANS=`nmap -sP $SERVER | grep report  | awk '{ print $5 }'`
   if [ "$ANS" != "" ] && [ "$ANS" != "$SERVER" ] ;then
   echo  $ANS
     else
       ANS=""
       fi
   fi
  
         # wget
 if [ "$ANS" = "" ];then
   ANS=`wget -T 2  -t 1 -d $SERVER 2>&1 |grep  WWW | sed -e  "s/\"/ /g" -e "s/=/ /g"|awk ' { print $4}'`
   echo  $ANS
   fi


 if [ "$ANS" = "" ];then
  
    DEV=`echo $SERVER | sed "s/\./ /g" | awk '{ print $4}'`
    ANS="unkown"$DEV
    echo $ANS
    fi
    
