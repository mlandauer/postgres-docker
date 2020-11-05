#!/usr/bin/env bash

while true; do
    echo "waiting for the role to be decided ..."
    if [[ -e /run_scripts/run.sh ]]; then
        /run_scripts/run.sh
        break ;
    fi
    sleep 1
done

