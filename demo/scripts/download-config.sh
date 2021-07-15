#!/bin/sh 
rm -rf config/
#git clone -b master https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data.git config
# Temporary workaround:
git clone -b develop https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data.git config
git -C ./config checkout c8463380d988f0aa3f861125ca3f7a12444f61b6
