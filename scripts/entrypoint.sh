#!/usr/bin/env bash

set -eou pipefail



mkdir -p "$PGDATA"
rm -rf "$PGDATA"/*
chmod 0777 "$PGDATA"
chown postgres /var/pv
export POSTGRES_INITDB_ARGS=${POSTGRES_INITDB_ARGS:-}
exec su-exec postgres initdb $POSTGRES_INITDB_ARGS --pgdata="$PGDATA"

echo "startig postgres..............................///////"
if [[ -e /run_scripts/run.sh ]]; then
    echo "startig run_scripts..............................///////"
    exec su-exec postgres  exec /run_scripts/run.sh ;
fi
exec su-exec postgres exec  postgres