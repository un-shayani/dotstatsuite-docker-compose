#!/bin/sh 

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

SERVER_ADDRESS=${1:-localhost}

CONFIG_DIR=${2:-$SCRIPT_DIR/../config}
SAMPLE_DIR=${3:-$SCRIPT_DIR/../samples}

echo Configuration of mono tenant installation with 2 dataspaces
echo Server address  : $SERVER_ADDRESS
echo Script directory: $SCRIPT_DIR
echo Config directory: $CONFIG_DIR
echo Sample directory: $SAMPLE_DIR

# Remove prev. version of config folder
rm -rf $CONFIG_DIR

# Get config directory from dotstatsuite-config repository
git clone https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config.git $CONFIG_DIR;

# Remove tenant folders not needed (dev)
rm -r $CONFIG_DIR/data/dev/configs/default/
rm -r $CONFIG_DIR/data/dev/configs/oecd2/
rm -r $CONFIG_DIR/data/dev/configs/test/

# Set oecd (tenant) folder to default 
mv $CONFIG_DIR/data/dev/configs/oecd/ $CONFIG_DIR/data/dev/configs/default/

# Remove application folder not used
rm -r $CONFIG_DIR/data/dev/configs/default/webapp/

# Copy sample configuration files
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/datasources.json $CONFIG_DIR/data/dev/configs/datasources.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/tenants.json $CONFIG_DIR/data/dev/configs/tenants.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/default/data-explorer/settings.json $CONFIG_DIR/data/dev/configs/default/data-explorer/settings.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/default/data-lifecycle-manager/settings.json $CONFIG_DIR/data/dev/configs/default/data-lifecycle-manager/settings.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/default/data-viewer/settings.json $CONFIG_DIR/data/dev/configs/default/data-viewer/settings.json

#Replace server address in JS configuration files
$SCRIPT_DIR/replace.server.address.sh $CONFIG_DIR/data/dev/configs/ $SERVER_ADDRESS localhost

echo Mono tenant configuration is done.
