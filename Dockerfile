FROM postgres:9.4

# Add database creation 
#ADD  files/init.sql /docker-entrypoint-initdb.d/
COPY files/apiman_pg_new.sql /docker-entrypoint-initdb.d/
#COPY files/apiman-db-create.sh /docker-entrypoint-initdb.d/
