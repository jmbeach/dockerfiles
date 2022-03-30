#docker network create --subnet 192.168.2.0/24 kafka
docker run --name kafka -d \
  -v $PWD/data:/root/kafka-data \
  -v $PWD/utils:/root/utils \
  --network kafka \
  --ip 192.168.2.2 \
  --hostname kafka0 \
  -p 127.0.0.1:29092:29092/tcp \
  -p 127.0.0.1:2181:2181/tcp \
  -v /var/run/docker.sock:/var/run/docker.sock \
  kafka

docker run --name kowl -d \
  -p 8080:8080 \
  --network kafka \
  --ip 192.168.2.3 \
  --hostname kowl \
  -e KAFKA_BROKERS=kafka0:39092 \
  quay.io/cloudhut/kowl:master

docker run --name kowl-dev -d \
  -p 8081:8080 \
  --network kafka \
  --ip 192.168.2.4 \
  --hostname kowl-dev \
  -e KAFKA_BROKERS=pkc-epwny.eastus.azure.confluent.cloud:9092 \
  -e KAFKA_TLS_ENABLED=true \
  -e KAFKA_SASL_ENABLED=true \
  -e KAFKA_SASL_USERNAME=4QJKO65MMTFVVXSJ \
  -e KAFKA_SASL_PASSWORD=283HWRePvgLNV8puetrpYDxWb6hbNuO0/WItBYK5YroNNzgMqoqIsX+KBH2wl8Ka \
  quay.io/cloudhut/kowl:master