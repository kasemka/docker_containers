FROM debian:buster

RUN	 apt-get update && apt-get install mariadb-server apt -y
RUN  rm -rf /etc/my.cnf /var/lib/mysql/my.cnf

WORKDIR /app

COPY ./conf/my.cnf /etc/mysql/

COPY ./tools/base.sql . 

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

ARG			DB_NAME
ARG			DB_USER
ARG			DB_USER_PASSWORD
ARG			ROOT_PASSWORD

RUN  sed -i "s|DATABASE_NAME|$DB_NAME|g" base.sql && \
	sed -i "s|DATABASE_USER|$DB_USER|g" base.sql && \
	sed -i "s|USER_PASSWORD|$DB_USER_PASSWORD|g" base.sql && \
	sed -i "s|DATABASE_ROOT_PASSWOD|$ROOT_PASSWORD|g" base.sql

RUN service mysql start && \
	mysql -u root < base.sql && \
	rm base.sql

EXPOSE		3306

CMD ["mysqld_safe"]

