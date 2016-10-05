#!/bin/bash
set -e

export DISABLE_SPRING=1 

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

exec bundle exec "$@"
