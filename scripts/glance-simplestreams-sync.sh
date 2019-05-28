#!/bin/bash
if [ -f /etc/juju-proxy.conf ]; then
    source /etc/juju-proxy.conf
elif [ -f /home/ubuntu/.juju-proxy ]; then
    source /home/ubuntu/.juju-proxy
fi
/usr/share/glance-simplestreams-sync/glance-simplestreams-sync.py
/usr/share/glance-simplestreams-sync/get-simplestreams-image-converter.sh
/usr/share/glance-simplestreams-sync/simplestreams-image-convert.sh
