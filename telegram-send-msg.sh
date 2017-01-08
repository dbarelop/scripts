#!/bin/bash

TOKEN=""
CHAT_ID=""

URL="https://api.telegram.org/bot$TOKEN/sendMessage"

TEXT=$(echo "`hostname`'s message: $*")

curl -s -d "chat_id=$CHAT_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null

