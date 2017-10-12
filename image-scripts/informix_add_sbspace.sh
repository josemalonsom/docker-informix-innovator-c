#!/bin/bash

set -e

SBSPACENAME="sbsp1"

if (onstat -d 2>/dev/null | grep -q "$SBSPACENAME"); then
    exit 0
fi

echo "Add sbspace: $SBSPACENAME"

source /home/informix/ifx_dev.env

INFORMIX_DATA="$HOME/data/spaces"
SBSP="$INFORMIX_DATA/$SBSPACENAME"

touch "$SBSP"
chmod 660 "$SBSP"

onspaces -c -S "$SBSPACENAME" -p "$SBSP" -o 0 -s 10240
ontape -s -L 0

sed -i -e "s/^SBSPACENAME/SBSPACENAME $SBSPACENAME/" $INFORMIXDIR/etc/onconfig.dev

onmode -ky
oninit
