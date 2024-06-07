#!/bin/sh
set -ex

wait_for() {
    timeout=60
    while ! nc -z "$1" "$2" >/dev/null 2>&1; do
        echo "Waiting for $1:$2..."
        sleep 1
        timeout=$((timeout - 1))
        if [ $timeout -eq 0 ]; then
            echo "Timeout waiting for $1:$2"
            exit 1
        fi
    done
}

wait_for db 5432

python manage.py migrate

exec "$@"
