HOST:=127.0.0.1

postgres-inmemory:
	docker run -d --tmpfs /pg-data:rw,size=1024m -e PGDATA=/pg-data -p 5432:5432 postgres:9.5

postgres-inmemory:
	docker run -d -p 5432:5432 postgres:9.5


benchmark-init:
	docker run --rm -it postgres pgbench -h ${HOST} -U postgres:9.5 -i -s 50

benchmark-run:
	docker run --rm -it postgres pgbench -h ${HOST} -U postgres:9.5 -c 20 -t 1000 -P 5
