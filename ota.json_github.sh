#!/bin/sh
#
# read ota.json file from github
#
# sudo apt-get install jq

# my gsi name: gsiname="lineage_arm64_bvS"

# download ota file
curl -s https://altushost-swe.dl.sourceforge.net/project/andyyan-gsi/lineage-19.x/ota.json | jq > ota.json
#cat ota.json

variant=`jq -r '.variants[] | select(.name=="lineage_arm64_bvS") | .url' < ota.json`
#echo "$variant"

# download and extract
wget $variant && unxz -v -k $(basename $variant)

# flash with fastboot
adb reboot fastboot
sleep 10
fastboot flash system vbmeta.img
fastboot flash system $(basename ${variant%.*})

exit
