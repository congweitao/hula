#!/usr/bin/bash

# make a patch
patch -Naur kernel_old/ kernel_new/ >kernel.patch

# import a patch\
cd source_code/
patch -Np1 < ../kernel.patch
