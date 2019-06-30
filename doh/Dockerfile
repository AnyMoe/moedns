FROM golang:alpine  as goBuilder

LABEL MAINTAINER "AnyMoe"  

RUN mkdir ~/gopath; \
    export GOPATH=~/gopath; \
    apk update; \
	apk add --no-cache ca-certificates git make;\
    git clone https://github.com/m13253/dns-over-https.git && cd dns-over-https

COPY make.sh /go/

RUN chmod 744 /go/make.sh ;\
    /go/make.sh

FROM alpine:edge

COPY --from=goBuilder /go/dns-over-https/doh-server/doh-server /usr/bin/doh-server
COPY --from=goBuilder /go/dns-over-https/doh-server/doh-server.conf /etc/dns-over-https/doh-server.conf

EXPOSE 8053

ENTRYPOINT ["/usr/bin/doh-server"]
CMD ["-conf", "/etc/dns-over-https/doh-server.conf"]