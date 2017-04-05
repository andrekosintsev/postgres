FROM postgres:9.4

# Add database creation 
COPY files/apiman_pg_new.ddl /docker-entrypoint-initdb.d/
COPY files/apiman-db-create.sh /docker-entrypoint-initdb.d/
