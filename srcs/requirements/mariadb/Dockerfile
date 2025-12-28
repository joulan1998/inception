FROM debian:12

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/setup.sh"]