#!/usr/bin/env bash

set -e

BROKER="kafka-node-1:9092"


/opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server "${BROKER}" \
    --create \
    --if-not-exists \
    --topic raw-telemetry \
    --partitions 6 \
    --replication-factor 3

/opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server "${BROKER}" \
    --create \
    --if-not-exists \
    --topic device-state-compacted \
    --partitions 3 \
    --replication-factor 3 \
    --config cleanup.policy=compact

/opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server "${BROKER}" \
    --create \
    --if-not-exists \
    --topic rule-executions \
    --partitions 3 \
    --replication-factor 3

/opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server "${BROKER}" \
    --create \
    --if-not-exists \
    --topic telemetry-dlq \
    --partitions 3 \
    --replication-factor 3

/opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server "${BROKER}" \
    --list
