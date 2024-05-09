#!/bin/sh
set -e

if [ "$1" = 'rails' ] && [ "$2" = 's' ]; then
    rm -f /myapp/tmp/pids/server.pid
    rails db:migrate
fi

exec "$@"
