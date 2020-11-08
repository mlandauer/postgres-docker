#!/usr/bin/env bash
set -eou pipefail

while true; do
    echo "waiting for the role to be decided ..."
    if [[ -e /run_scripts/role/run.sh ]]; then
        /run_scripts/role/run.sh && break ;
    fi
    sleep 1
done
