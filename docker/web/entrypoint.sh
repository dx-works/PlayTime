#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid and puma.sock for Rails.
rm -rf /app/tmp/pids
rm -rf /app/tmp/sockets
mkdir -p /app/tmp/sockets
mkdir -p /app/tmp/pids

echo "entrypoint.sh: exec rails assets:precompile"
if [ "$RAILS_ENV" = "staging" ] || [ "$RAILS_ENV" = "production" ]; then
  rails assets:precompile
  rails db:migrate
fi


#!/bin/sh
echo "entrypoint.sh: pumactl start"
pumactl start


