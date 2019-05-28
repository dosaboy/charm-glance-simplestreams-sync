#!/bin/bash
if [ -f /etc/profile.d/juju-proxy.sh ]; then
    source /etc/profile.d/juju-proxy.sh
elif [ -f /etc/juju-proxy.conf ]; then
    source /etc/juju-proxy.conf
elif [ -f /home/ubuntu/.juju-proxy ]; then
    source /home/ubuntu/.juju-proxy
fi

source /etc/lsb-release
if [[ $DISTRIB_RELEASE > "18.04" ]]; then
    PYTHON=python3
else
    PYTHON=python
fi

mkdir -p /var/cache/simplestreams-image-convert
lockfile=/var/cache/simplestreams-image-convert/lock
(
flock -e 200
$PYTHON /usr/share/glance-simplestreams-sync/glance-simplestreams-sync.py
/usr/share/glance-simplestreams-sync/get-simplestreams-image-converter.sh
/usr/share/glance-simplestreams-sync/simplestreams-image-convert.sh
) 200>$lockfile
