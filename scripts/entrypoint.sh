#!/usr/bin/env bash

set -eou pipefail


chown postgres /var/pv

su-exec postgres  /scripts/run.sh