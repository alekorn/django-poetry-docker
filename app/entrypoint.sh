#!/bin/sh
set -ex

python manage.py migrate

exec "$@"
