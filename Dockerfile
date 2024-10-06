FROM alpine:latest

WORKDIR /opt

RUN apk update && apk add curl jq doctl
COPY ./ddns.sh /opt/ddns.sh
COPY ./entrypoint.sh /opt/entrypoint.sh

CMD ["/opt/entrypoint.sh"]

