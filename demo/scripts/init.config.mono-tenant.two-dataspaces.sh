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
git clone https://gitlab.com/sis-cc/topologies/siscc-config-data.git $CONFIG_DIR -b staging;

# Remove tenant folders not needed (prod)
rm -r $CONFIG_DIR/configs/default/

# The following are optional to be deleted or may be kept for further reference
rm -r $CONFIG_DIR/configs/abs/
rm -r $CONFIG_DIR/configs/astat/
rm -r $CONFIG_DIR/configs/ins/
rm -r $CONFIG_DIR/configs/oecd/
rm -r $CONFIG_DIR/configs/statec/
rm -r $CONFIG_DIR/configs/statsnz/
rm -r $CONFIG_DIR/configs/bfs/
rm -r $CONFIG_DIR/configs/oecd-eco/

rm -r $CONFIG_DIR/assets/abs/
rm -r $CONFIG_DIR/assets/astat/
rm -r $CONFIG_DIR/assets/ins/
rm -r $CONFIG_DIR/assets/statec/
rm -r $CONFIG_DIR/assets/oecd/
rm -r $CONFIG_DIR/assets/statsnz/
rm -r $CONFIG_DIR/assets/bfs/
rm -r $CONFIG_DIR/assets/oecd-eco/

# Set the default tenant (using siscc)
mv $CONFIG_DIR/configs/siscc/ $CONFIG_DIR/configs/default/

# Copy sample configuration files
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/datasources.json $CONFIG_DIR/configs/datasources.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/tenants.json $CONFIG_DIR/configs/tenants.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/default/data-explorer/settings.json $CONFIG_DIR/configs/default/data-explorer/settings.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/default/data-lifecycle-manager/settings.json $CONFIG_DIR/configs/default/data-lifecycle-manager/settings.json
\cp -f $SAMPLE_DIR/mono-tenant-two-dataspaces/default/data-viewer/settings.json $CONFIG_DIR/configs/default/data-viewer/settings.json

#Replace server address in JS configuration files
$SCRIPT_DIR/replace.server.address.sh $CONFIG_DIR/configs/ $SERVER_ADDRESS localhost

echo Mono tenant configuration is done.
