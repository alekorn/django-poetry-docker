#!/bin/sh
set -ex

python manage.py migrate
python manage.py collectstatic --noinput

exec "$@"