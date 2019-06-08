FROM mysql:8
ENV MYSQL_ROOT_PASSWORD test
COPY ./init /docker-entrypoint-initdb.d
