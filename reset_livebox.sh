#!/bin/bash
PASSWORD="$1"
if [ -z $PASSWORD ]; then
	echo "Usage: $0 password"
	exit 0
fi
echo "Current public IP: $(curl --silent ifconfig.me)"
echo "Restarting Livebox connection..."
URL=$(wget --post-data="page=home&authaction=login&authlogin=admin&authpasswd=$PASSWORD" http://192.168.1.1/index.cgi -O - 2> /dev/null | grep 'index.cgi?page=internet&sessionid=' | sed -E 's/^.*index.cgi\?page=internet&sessionid=([^"]+)".*$/http:\/\/192.168.1.1\/index.cgi?page=internet\&action=reset\&sessionid=\1/')
wget "$URL" -O - > /dev/null 2>&1
sleep 5
echo "Current public IP: $(curl --silent ifconfig.me)"