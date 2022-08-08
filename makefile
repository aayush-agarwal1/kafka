properties := application.properties
topic := example-123
group1 := g1
group2 := g2

setup:
	docker compose up -d
	sleep 10
	docker compose exec broker kafka-topics --create --topic $(topic) --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1

build:
	go build -o out/consumer util.go consumer.go
	go build -o out/producer util.go producer.go

run_consumer_1:
	./out/consumer $(properties) $(topic) $(group1) 

run_consumer_2:
	./out/consumer $(properties) $(topic) $(group1)

run_consumer_3:
	./out/consumer $(properties) $(topic) $(group2)

run_producer:
	./out/producer $(properties) $(topic)
 