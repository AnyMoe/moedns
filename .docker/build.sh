#!/bin/bash

CONFS=(accelerated-domains.china google.china apple.china)
cd /root/
if [ ! -f "master.zip" ]; then  
wget -c https://github.com/felixonmars/dnsmasq-china-list/archive/master.zip
unzip master.zip && cd dnsmasq-china-list-master
make SERVER="${CN_DNS1}\n  forward-addr: 1.2.4.8${CN_DNS2}" unbound
cp -f *.unbound.conf /etc/unbound/conf
#cp bogus-nxdomain.china.conf /etc/unbound/conf

(
cat << EOF
forward-zone:
  name: "xn--fiqz9s."
  forward-addr: ${CN_DNS1}
  forward-addr: ${CN_DNS2}

forward-zone:
  name: "xn--zfr164b."
  forward-addr: 1.2.4.8
EOF
) >  /etc/unbound/conf/cn.unbound.conf
fi
