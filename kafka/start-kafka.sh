#!/bin/bash
/root/kafka/bin/zookeeper-server-start.sh -daemon /root/kafka/config/zookeeper.properties
# zookeeper has a session expiry time of 18000ms https://github.com/wurstmeister/kafka-docker/issues/389
sleep 20
/root/kafka/bin/kafka-server-start.sh /root/kafka/config/server.properties