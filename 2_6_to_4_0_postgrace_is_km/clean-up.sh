#Clean the databases
PGPASSWORD=root
export PGPASSWORD
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d apim_2_6 -U root -h localhost -p 5435 -f /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_cleanup.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d reg_2_6 -U root -h localhost -p 5436 -f /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_cleanup.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d user_2_6 -U root -h localhost -p 5437 -f /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_cleanup.sql
#Clean up docker containers
cd /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_2.6/apim
docker kill pg_container_user_2_6
docker-compose down
cd /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_2.6/reg
docker kill pg_container_reg_2_6
docker-compose down
cd /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_2.6/user
docker kill pg_container_user_2_6
docker-compose down
rm -fr /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/wso2am-2.6.0
rm -fr /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/wso2is-km-5.7.0
