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
