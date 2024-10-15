#!/bin/bash
rabbitmqctl enable_feature_flag all

set -e

# Set permissions and get hostname
echo "$RABBITMQ_ERLANG_COOKIE" > /var/lib/rabbitmq/.erlang.cookie
chmod 400 /var/lib/rabbitmq/.erlang.cookie
HOSTNAME=$(hostname)
echo "Starting RabbitMQ Server for host: $HOSTNAME"

# Start RabbitMQ server and optionally join cluster
/usr/local/bin/docker-entrypoint.sh rabbitmq-server &
sleep 5
rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit@$HOSTNAME.pid

if [ -n "$JOIN_CLUSTER_HOST" ]; then
    rabbitmqctl stop_app
    rabbitmqctl join_cluster rabbit@$JOIN_CLUSTER_HOST
    rabbitmqctl start_app
fi

# Keep process active
tail -f /dev/null
