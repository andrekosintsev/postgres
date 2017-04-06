#!/bin/sh
echo "******CREATING APIMAN DATABASE******"
# su -c "psql -d apiman -f /docker-entrypoint-initdb.d/apiman_postgresql.ddl"  -s /bin/sh postgres
su -c "psql -d ApiManagerDS -f /docker-entrypoint-initdb.d/apiman_pg_new.ddl"  -s /bin/sh postgres
gosu  postgres postgres --single -j ApiManagerDS < /docker-entrypoint-initdb.d/apiman_pg_new.ddl
echo ""
echo "******APIMAN DATABASE CREATED******"