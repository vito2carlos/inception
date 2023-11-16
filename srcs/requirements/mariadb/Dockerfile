FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

RUN sed -i '30s/127.0.0.1/0.0.0.0/g'  /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup-database.sh /

RUN chmod +x /setup-database.sh

CMD ["/setup-database.sh"]
