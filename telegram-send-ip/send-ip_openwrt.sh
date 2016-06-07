#!/bin/sh

server=""
port=""
path=""

hostname=$(cat /etc/config/system | grep hostname | sed -r "s/^.*'([^']+)'.*\$/\1/")
# TODO: add support for IPv6
ip=$(ifconfig | grep "inet " | awk -F'[: ]+' '{ print $4 }' | grep -v '127.0.0.1' | tr '\n' ' ')

curl -X POST --data "hostname=$hostname&ip_address=$ip" $server:$port/$path
