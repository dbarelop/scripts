#!/bin/bash
iface=$(sudo ifconfig bridge create)
sudo ifconfig $iface addm en0 addm en1 up
