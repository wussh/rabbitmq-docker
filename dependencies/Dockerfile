FROM rabbitmq:4.0.2-management-alpine

# Update apk and install required packages
RUN apk update && apk --no-cache add curl unzip

# Download the rabbitmq_delayed_message_exchange plugin from GitHub
RUN curl -L -o /opt/rabbitmq/plugins/rabbitmq_delayed_message_exchange-4.0.2.ez \
    https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v4.0.2/rabbitmq_delayed_message_exchange-4.0.2.ez

# Enable RabbitMQ plugins
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange rabbitmq_tracing
