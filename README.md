# Moe DNS

an anti-pollution DNS server

## Deployment

```shell
git clone https://github.com/AnyMoe/moedns.git
cd moedns
docker-compose up -d
```
enjoy!

P.S. you should install [Docker](https://www.docker.com) and [Docker Compose](https://docs.docker.com/compose/) first.
PPS. By default, public network access of ipv4 is disabled. If you need external services, change  ``access-control: 0.0.0.0/0 refuse`` to ``access-control: 0.0.0.0/0 allow`` in acl.conf.

## Environment Variables:

| Name              | Default Value               |
| ----------------- | --------------------------- |
| CN_DNS1           | 114.114.114.114             |
| CN_DNS2           | 119.29.29.29                |