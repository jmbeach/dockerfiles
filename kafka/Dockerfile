FROM ubuntu:20.04
RUN apt update
RUN apt install wget gnupg gnupg2 gnupg1 software-properties-common --yes
RUN wget -O - https://apt.corretto.aws/corretto.key | apt-key add - 
RUN add-apt-repository 'deb https://apt.corretto.aws stable main'
RUN apt-get update; apt-get install -y java-11-amazon-corretto-jdk
RUN wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
RUN tar -xvf kafka_2.13-3.1.0.tgz
RUN mv kafka_2.13-3.1.0 ~/kafka
RUN echo 'PATH="$PATH:~/kafka/bin"' >> ~/.bashrc
RUN echo 'source /root/utils/utils.sh' >> ~/.bashrc
RUN mkdir ~/kafka-data
RUN mkdir ~/zookeeper-data
RUN sed -i 's/dataDir=\/tmp\/zookeeper/dataDir=\/root\/zookeeper-data/' ~/kafka/config/zookeeper.properties
RUN sed -i 's/log.dirs=\/tmp\/kafka-logs/log.dirs=\/root\/kafka-data/' ~/kafka/config/server.properties
RUN sed -i 's/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/:9092,PARENT:\/\/:29092,DOCKER:\/\/:39092/' ~/kafka/config/server.properties
RUN sed -i 's/#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/advertised.listeners=DOCKER:\/\/kafka0:39092,PARENT:\/\/localhost:29092,PLAINTEXT:\/\/localhost:9092/' ~/kafka/config/server.properties
RUN sed -i 's/#listener.security.protocol.map=PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL/listener.security.protocol.map=PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL,PARENT:PLAINTEXT,DOCKER:PLAINTEXT/' ~/kafka/config/server.properties
COPY start-kafka.sh /root/start-kafka.sh
CMD ~/start-kafka.sh