#docker network create --subnet 192.168.2.0/24 kafka
docker run --name kafka -v ./data:/root/data --network kafka --ip 192.168.2.2 --hostname kafka0 -p 127.0.0.1:29092:29092/tcp kafka