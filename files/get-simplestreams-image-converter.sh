#!/bin/bash
fname=simplestreams-image-convert.sh
path=/usr/share/glance-simplestreams-sync/$fname
if ! dpkg -s jq &>/dev/null || ! dpkg -s qemu-utils &>/dev/null; then
  sudo apt update
  sudo apt install jq qemu-utils -y
fi
if ! [ -r "$path" ]; then
url=`curl https://api.github.com/users/dosaboy/gists 2>/dev/null| jq -r .[].files[].raw_url| grep $fname`
wget $url -O $path
fi
chmod +x $path 
