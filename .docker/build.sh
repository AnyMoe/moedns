#!/bin/bash

CONFS=(accelerated-domains.china google.china apple.china)
cd /etc/dnsmasq.d/
for confName in ${CONFS[@]}
do
    if [ ! -f "${confName}.conf" ]; then
    wget https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/$confName.conf
      if [ ! -z $CN_DNS ];then
      sed -i "s|^\(server.*\)/[^/]*$|\1/$CN_DNS|" ./$confName.conf
      fi
    fi
done
if [ ! -f "bogus-nxdomain.china.conf" ]; then
  wget https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/bogus-nxdomain.china.conf
fi
