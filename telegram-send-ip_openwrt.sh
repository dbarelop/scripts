#!/bin/sh

TOKEN=""
CHAT_ID=""

URL="https://api.telegram.org/bot$TOKEN/sendMessage"

hostname=$(cat /etc/config/system | grep hostname | sed -r "s/^.*'([^']+)'.*\$/\1/")
# TODO: add support for IPv6
ip=$(ifconfig | grep "inet " | awk -F'[: ]+' '{ print $4 }' | grep -v '127.0.0.1' | tr '\n' ' ')
TEXT=$(echo "$hostname's IP address is: $ip")

curl -s -d "chat_id=$CHAT_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null

