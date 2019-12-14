#!/bin/bash


# step 1
# have at least three nodes: osd1 osd2 osd3
# have at least two disks, one for os installation, one to be used to server GlusterFS storage

# step 2 Format and mount the bricks

# install gluster repo for centos 7

for node in osd1 osd2 osd3;do
    ssh $node umount /dev/sdd
    ssh $node mkdir -p /data/brick1
    ssh $node mkfs.xfs -i size=512 /dev/sdd -f
    ssh $node mount /dev/sdd /data/brick1
    ssh $node yum install -y centos-release-storage-common
    ssh $node rpm -ivh http://mirror.centos.org/altarch/7/extras/aarch64/Packages/centos-release-gluster5-1.0-1.el7.centos.noarch.rpm
    ssh $node yum makecache
    # step 3 install glusterfs
    ssh $node yum -y install glusterfs-server
    ssh $node systemctl start glusterd
done

gluster peer probe osd2
gluster peer probe osd3

# setup a gluster volume
for node in osd1 osd2 osd3;do
	ssh $node mkdir -p /data/brick1/gv0
done

gluster volume create gv0 stripe 3 osd1:/data/brick1/gv0 osd2:/data/brick1/gv0 osd3:/data/brick1/gv0
gluster volume start gv0

# You can set the client.event-thread and server.event-thread values for the client and server components. 
#Setting the value to 3, for example, would enable handling three network connections simultaneously.
gluster volume set gv0 client.event-threads 3
gluster volume set gv0 server.event-threads 3
