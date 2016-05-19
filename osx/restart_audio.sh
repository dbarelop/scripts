#!/bin/bash
sudo kextunload /System/Library/Extensions/AppleHDA.kext
sudo kextload /System/Library/Extensions/AppleHDA.kext
ps aux | grep 'coreaudio[d]' | awk '{print $2}' | xargs sudo kill
