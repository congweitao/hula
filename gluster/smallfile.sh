#!/usr/bin/bash

python smallfile_cli.py --operation create --threads 8 --file-size 1024 --files 2048 --top /mnt --host-set osd1,osd2,osd3

gluster volume set gv0 features.cache-invalidation on
gluster volume set gv0 features.cache-invalidation-timeout 600
gluster volume set gv0 performance.stat-prefetch on
gluster volume set gv0 performance.cache-invalidation on
