#!/usr/bin/env bash
set -eou pipefail

echo "waiting for the role to be decided ..."
if [ "$SSL_MODE" = "ON" ]; then
    pg_isready --host="$PRIMARY_HOST" -d "sslmode=require sslcert=/tls/certs/client/client.crt sslkey=/tls/certs/client/client.key" --timeout=2 &>/dev/null && break
else
    pg_isready --host="$PRIMARY_HOST" --timeout=2 &>/dev/null && break
fi

if [[ -e /run_scripts/role/run.sh ]]; then
    /run_scripts/role/run.sh && break ;

fi

