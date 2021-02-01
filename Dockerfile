FROM mysql:5

COPY ./db.sql /docker-entrypoint-initdb.d/mer.sql

EXPOSE 3306