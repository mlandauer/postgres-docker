#!/usr/bin/env bash


set -eou pipefail

echo "...............wal position is too old. requesting for base_backup..."


# get basebackup
mkdir -p "$PGDATA"
rm -rf "$PGDATA"
chmod 0700 "$PGDATA"




