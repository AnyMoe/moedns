#!/bin/bash

while true
do 
    procnum=`ps -ef|grep "dnsmasq"|grep -v grep|wc -l`
   if [ $procnum -eq 0 ]; then
       dnsmasq -k&
   fi
   sleep 60
done