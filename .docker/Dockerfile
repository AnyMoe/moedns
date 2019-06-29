FROM golang:alpine  as goBuilder

RUN apk update; \
	apk add --no-cache ca-certificates git gcc build-base;\
    go get -v github.com/cloudflare/cloudflared/cmd/cloudflared
WORKDIR /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared
RUN go build ./

FROM alpine:edge

LABEL MAINTAINER "AnyMoe"  

RUN apk --no-cache add bash ca-certificates make s6 unbound; \
        rm -rf /var/cache/apk/*; \
        mkdir -p /usr/local/service/unbound;

VOLUME ["/etc/unbound"]

COPY build.sh /usr/local/bin/
COPY run /usr/local/service/unbound/
RUN chmod 744 /usr/local/bin/build.sh; \
    chmod a+x /usr/local/service/*/run

COPY --from=goBuilder /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared/cloudflared /usr/local/bin/cloudflared

EXPOSE 53 53/udp

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/build.sh;(/usr/local/bin/cloudflared proxy-dns --address 0.0.0.0 --port 15353 &);/bin/s6-svscan /usr/local/service;"]
