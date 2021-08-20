#!/bin/bash

set -eo pipefail
MANAGE="./manage.py"

run_server() {
    python3 "$MANAGE" makemigrations
    python3 "$MANAGE" migrate

    # Docker binds container ip to random ip address in subnet, thefore we have to
    # listen on all ips or set static ip at docker compose
    python3 "$MANAGE" runserver 0.0.0.0:8000
}

# Default options is run_server
if [[ -z "$1" ]]; then
    run_server
    exit 0
fi

case "$1" in
    run)
        run_server 
        exit 0
        ;;

    # Allow managing the django instance
    manage)
        shift
        python3 "$MANAGE" "$@" 
        exit 0
        ;;
    *)
        echo "Wrong commad" >&2
        exit 1
esac