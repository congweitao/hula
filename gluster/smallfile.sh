#!/usr/bin/bash

python smallfile_cli.py --operation create --threads 8 --file-size 1024 --files 2048 --top /mnt --host-set osd1,osd2,osd3

gluster volume set gv0 features.cache-invalidation on
gluster volume set gv0 features.cache-invalidation-timeout 600
gluster volume set gv0 performance.stat-prefetch on
gluster volume set gv0 performance.cache-invalidation on

echo "always" > /sys/kernel/mm/transparent_hugepage/enabled

gluster volume set gv0 client.event-threads 4
gluster volume set gv0 server.event-threads 2
gluster volume set gv0 group metadata-cache
gluster volume set gv0 nfs.mem-factor 150
gluster volume set gv0 cluster.read-hash-mode 2
gluster volume set gv0 performance.read-ahead-page-count 16
gluster volume set gv0 network.tcp-window-size 1048576
gluster volume set gv0 performance.client-io-threads on
gluster volume set gv0 server.outstanding-rpc-limit 128
gluster volume set gv0 performance.nfs.quick-read on
gluster volume set gv0 performance.nfs.io-threads on
gluster volume set gv0 tuned-adm profile throughput-performance

tuned-adm profile throughput-performance

