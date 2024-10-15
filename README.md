# RabbitMQ Cluster Docker Setup

This guide provides a straightforward method to set up a RabbitMQ Cluster environment using the official RabbitMQ Docker image with Docker Compose. This setup includes built-in load balancing with HAProxy for improved scalability and performance.

## Features

- **Easy Setup**: Quick and straightforward configuration with Docker Compose.
- **Official Image**: Utilizes the latest official RabbitMQ image for optimal performance and compatibility.
- **Erlang Cookie Management**: Automatically handles Erlang cookie configuration for seamless clustering.
- **Built-in Load Balancing**: Leverages HAProxy for efficient load balancing across RabbitMQ nodes.

## Quick Start

To launch the RabbitMQ cluster, simply run:

```bash
docker-compose up
```

Once the services are up and running, access the RabbitMQ dashboard at:

[http://localhost:15672](http://localhost:15672)

**Login Credentials:**

- **Username**: `guest`  
- **Password**: `guest`

## Configuration

### `docker-compose.yml`

The following `docker-compose.yml` file configures three RabbitMQ services and one HAProxy load balancer:

#### Services Overview

| Service     | Description               |
| ----------- | ------------------------- |
| `rabbitmq1` | Primary RabbitMQ instance (cluster)        |
| `rabbitmq2` | Secondary RabbitMQ instance (cluster member) |
| `rabbitmq3` | Tertiary RabbitMQ instance (cluster member) |
| `haproxy`   | Load Balancer for RabbitMQ nodes             |

### Default Exposed Ports

| Host              | Description                                         |
| ----------------- | --------------------------------------------------- |
| `localhost:5672`  | AMQP 0-9-1 and AMQP 1.0 clients                     |
| `localhost:15672` | HTTP API clients, management UI, and `rabbitmqadmin` |

### `haproxy.cfg`

Configure the HAProxy load balancer with the following settings. Create a file named `haproxy.cfg` in the same directory as your `docker-compose.yml`.