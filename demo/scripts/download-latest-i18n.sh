#!/bin/sh 

git clone -b master https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config-data.git
mv dotstatsuite-config-data/i18n/ config/
rm -rf dotstatsuite-config-data/
