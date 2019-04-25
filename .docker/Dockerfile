FROM golang:alpine  as goBuilder

RUN apk update; \
	apk add --no-cache ca-certificates git gcc build-base;\
    go get -v github.com/cloudflare/cloudflared/cmd/cloudflared
WORKDIR /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared
RUN go build ./

FROM alpine:3.9

RUN apk --no-cache add bash ca-certificates dnsmasq; \
        rm -rf /var/cache/apk/*;

VOLUME ["/etc/dnsmasq.d"]

WORKDIR /usr/local/bin/
COPY build.sh .
COPY start.sh .
RUN chmod 744 build.sh start.sh;

RUN echo -e "\nlisten-address=0.0.0.0\nuser=root\nno-resolv\nno-poll\nserver=127.0.0.1#5353\n" >> /etc/dnsmasq.conf

COPY --from=goBuilder /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared/cloudflared /usr/local/bin/cloudflared

EXPOSE 53 53/udp

ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/build.sh;(/usr/local/bin/cloudflared proxy-dns --address 0.0.0.0 --port 5353 &);/usr/local/bin/start.sh;"]