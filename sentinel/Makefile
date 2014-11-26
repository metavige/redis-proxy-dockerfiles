install:
	docker build --rm -t nebula/redis-sentinel .

build:
	docker run -d -p 26379:26379 --name sentinel nebula/redis-sentinel

rm:
	docker rm -f sentinel
