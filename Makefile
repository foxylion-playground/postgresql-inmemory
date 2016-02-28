HOST:=127.0.0.1

postgresql-inmemory:
	docker run -d --name postgresql --tmpfs /pg-data:rw,size=1024m -e PGDATA=/pg-data -p 5432:5432 postgres:9.5

postgresql-persistent:
	docker run -d --name postgresql -p 5432:5432 postgres:9.5


benchmark-init:
	docker run --rm -it postgres:9.5 pgbench -h ${HOST} -U postgres -i -s 50

benchmark-run:
	docker run --rm -it postgres:9.5 pgbench -h ${HOST} -U postgres -c 20 -t 1000 -P 5
