#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
git clone http://github.com/rayrc/faviconfleet
cd faviconfleet
chown root:root faviconfleet 
chmod +x faviconfleet 
cp -a faviconfleet /usr/bin/faviconfleet
