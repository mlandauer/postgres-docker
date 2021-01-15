#!/usr/bin/env bash
set -eou pipefail

cp /scripts/recovery.conf /tmp
echo "recovery_target_timeline = 'latest'" >>/tmp/recovery.conf
echo "archive_cleanup_command = 'pg_archivecleanup $PGWAL %r'" >>/tmp/recovery.conf

# primary_conninfo is used for streaming replication
if [ "${SSL_MODE+0}" = "ON" ]; then
    echo "primary_conninfo = 'application_name=$HOSTNAME host=$PRIMARY_HOST sslmode=require sslcert=/tls/certs/client/client.crt sslkey=/tls/certs/client/client.key'" >>/tmp/recovery.conf
else
    echo "primary_conninfo = 'application_name=$HOSTNAME host=$PRIMARY_HOST'" >>/tmp/recovery.conf
fi
mv /tmp/recovery.conf "$PGDATA/recovery.conf"