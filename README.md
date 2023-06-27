# GSI-OTA-Update
Update your GSI-Image with ota.json and fastboot

This bash script searches on github for a current GSI image with the ota.json file.
It is downloaded, decompressed and then flashed to the connected mobile with fastboot.

Requirements: Mobile with activated ADB and fastboot. Linux PC, Bash and jq.
