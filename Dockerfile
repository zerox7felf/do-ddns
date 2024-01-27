FROM alpine:latest

WORKDIR /opt

RUN apk update && apk add curl jq doctl
COPY ./ddns.sh /opt/ddns.sh
RUN echo "*/30 * * * * /opt/ddns.sh" > /opt/crontab.tmp \
    && crontab /opt/crontab.tmp \
    && rm -rf crontab.tmp

CMD ["/usr/sbin/crond", "-f", "-d", "8"]

