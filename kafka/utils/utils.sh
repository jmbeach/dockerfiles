function topics () {
  kafka-topics.sh --bootstrap-server=localhost:9092 $@
}

function producer () {
  kafka-console-producer.sh --bootstrap-server=localhost:9092 $@
}

function consumer () {
  kafka-console-consumer.sh --bootstrap-server=localhost:9092 $@
}

function consumer-groups () {
  kafka-consumer-groups.sh --bootstrap-server=localhost:9092 $@
}

function setup-learning-topics () {
  topics --topic first_topic --create --partitions 3
}