#!/bin/sh

PUBLIC_IP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
ETCD_HOST=$PUBLIC_IP:4001

docker run -d -p 26379:26379 -e ETCD_HOST=$ETCD_HOST -e PROCESS_ID=$1 nebula/redis-sentinel
