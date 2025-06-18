#!/bin/sh

if ! command -v natpmpc >/dev/null 2>&1
then
    echo "natpmpc could not be found"
    apt update
    apt install natpmpc
    restart
fi


sh /config/mam.sh &
