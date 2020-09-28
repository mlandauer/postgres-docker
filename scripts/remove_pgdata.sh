#!/usr/bin/env bash


set -eou pipefail

echo "...............wal position is too old. requesting for base_backup..."


# get basebackup
chmod 0700 "$PGDATA"
#mkdir -p "$PGDATA"
rm -rf "$PGDATA"




