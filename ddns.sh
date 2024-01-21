#!/bin/sh

DELAY=${DELAY:-60}

if [ -z "$DOMAIN" ]; then echo "DOMAIN unset!"; exit 1; fi
if [ -z "$RECORD" ]; then echo "RECORD unset!"; exit 1; fi
if [ -z "$TOKEN"  ]; then echo "TOKEN unset!" ; exit 1; fi

while true; do
    echo "Running at $(date)"

    ip=$(curl -s ipinfo.io | tee /dev/stderr  | jq -r .ip)
    if [ "$?" != 0 ]; then
        echo "Error fetching IP from ipinfo.io"
        exit 1
    fi

    echo "Current IP: $ip"
    doctl compute domain records update "$DOMAIN" --record-id "$RECORD" --record-data "$ip" --access-token "$TOKEN"
    echo "doctl exited with status code $?"

    sleep $DELAY
done

