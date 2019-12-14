#!/usr/bin/bash

cd /home/wrf
wget http://build.openhpc.community/dist/1.3.9/OpenHPC-1.3.9.CentOS_7.aarch64.tar
tar xvf OpenHPC-1.3.9.CentOS_7.aarch64.tar
sh make_repo.sh
yum makecache
yum -y install gnu8-compilers-ohpc.aarch64
yum -y install openmpi3-gnu8-ohpc.aarch64
yum -y install phdf5-gnu8-openmpi3-ohpc.aarch64
yum -y install pnetcdf-gnu8-openmpi3-ohpc.aarch64
yum -y install netcdf-gnu8-openmpi3-ohpc.aarch64
yum -y install netcdf-fortran-gnu8-openmpi3-ohpc.aarch64

ln -s /opt/ohpc/pub/libs/gnu8/openmpi3/netcdf-fortran/4.5.2/include/netcdf.inc /opt/ohpc/pub/libs/gnu8/openmpi3/netcdf/4.7.1/include/

