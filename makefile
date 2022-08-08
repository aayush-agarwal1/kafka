build:
	go build -o out/consumer util.go consumer.go
	go build -o out/producer util.go producer.go

run_consumer_1:
	./out/consumer application.properties 1

run_consumer_2:
	./out/consumer application.properties 1

run_consumer_3:
	./out/consumer application.properties 2

run_producer:
	./out/producer application.properties
 