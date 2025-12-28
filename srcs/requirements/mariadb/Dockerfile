FROM debian:12
# FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

EXPOSE 3306

# CMD ["/tmp/setup.sh"]
ENTRYPOINT ["/tmp/setup.sh"]