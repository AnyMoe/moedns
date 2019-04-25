#!/bin/bash

cd /etc/dnsmasq.d/
if [ ! -f "accelerated-domains.china.conf" ]; then
  wget https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf
fi

if [ ! -f "bogus-nxdomain.china.conf" ]; then
  wget https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/bogus-nxdomain.china.conf
fi

if [ ! -f "google.china.conf" ]; then
wget https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/google.china.conf
fi

if [ ! -f "apple.china.conf" ]; then
wget https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/apple.china.conf
fi