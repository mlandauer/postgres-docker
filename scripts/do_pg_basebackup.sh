#!/usr/bin/env bash


set -eou pipefail

# get basebackup
mkdir -p "$PGDATA"
rm -rf "$PGDATA"/*
chmod 0700 "$PGDATA"
echo "attempting pg_basebackup..."

if [ "${SSL_MODE+0}" = "ON" ]; then
        pg_basebackup -X fetch  --pgdata "$PGDATA" --username=postgres --host="$PRIMARY_HOST" -d "sslmode=require sslcert=/tls/certs/client/client.crt sslkey=/tls/certs/client/client.key" &>/dev/null
    else
        pg_basebackup -X fetch --no-password --pgdata "$PGDATA" --username=postgres --host="$PRIMARY_HOST" &>/dev/null
fi
