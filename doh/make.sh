#!/bin/sh

#Solving the problem that China (except Hong Kong, Macau and Taiwan) cannot access golang.org
export GOPROXY=https://goproxy.io
export GO111MODULE=on

cd /go/dns-over-https
make doh-server/doh-server
