FROM alpine:latest

WORKDIR /opt/ddns

RUN apk update && apk add curl jq doctl

COPY ./ddns.sh /opt/ddns.sh

CMD ["/opt/ddns.sh"]

