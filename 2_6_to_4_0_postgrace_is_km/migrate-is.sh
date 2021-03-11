rm -fr wso2am-4.0.0-SNAPSHOT
unzip wso2am-4.0.0-SNAPSHOT.zip
cp postgresql-42.2.18.jar wso2am-4.0.0-SNAPSHOT/repository/components/lib/
cp master-datasources.xml.j2 wso2am-4.0.0-SNAPSHOT/repository/resources/conf/templates/repository/conf/datasources/
cp internal.jks wso2am-4.0.0-SNAPSHOT/repository/resources/security/
cp -r migration-resources-is wso2am-4.0.0-SNAPSHOT/migration-resources
cp org.wso2.carbon.is.migration-1.0.144.jar wso2am-4.0.0-SNAPSHOT/repository/components/dropins/
cp deployment.toml wso2am-4.0.0-SNAPSHOT/repository/conf/
PGPASSWORD=root
export PGPASSWORD
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d apim_2_5 -U root -h localhost -p 5432 -f /Users/prasanna/work/apim/migration_2021/postgracesql/db_cleanup.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d reg_2_5 -U root -h localhost -p 5433 -f /Users/prasanna/work/apim/migration_2021/postgracesql/db_cleanup.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d user_2_5 -U root -h localhost -p 5434 -f /Users/prasanna/work/apim/migration_2021/postgracesql/db_cleanup.sql
PGPASSWORD=root
export PGPASSWORD
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/pg_restore --host "localhost" --port "5432" --username "root" --dbname "apim_2_5" --section=pre-data --section=data --section=post-data --verbose "//Users/prasanna/work/apim/migration_2021/postgracesql/2_5_db_dumps/apim_db_2_5"
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/pg_restore --host "localhost" --port "5433" --username "root" --dbname "reg_2_5" --section=pre-data --section=data --section=post-data --verbose "/Users/prasanna/work/apim/migration_2021/postgracesql/2_5_db_dumps/reg_2_5"
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/pg_restore --host "localhost" --port "5434" --username "root" --dbname "user_2_5" --section=pre-data --section=data --section=post-data --verbose "/Users/prasanna/work/apim/migration_2021/postgracesql/2_5_db_dumps/user_2_5"
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d apim_2_5 -U root -h localhost -p 5432 -f /Users/prasanna/work/apim/migration_2021/postgracesql/db_apim_3_2.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d apim_2_5 -U root -h localhost -p 5432 -f /Users/prasanna/work/apim/migration_2021/apim-migration-resources/migration-scripts/migration-3.2.0_to_4.0.0/postgresql.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d reg_2_5 -U root -h localhost -p 5433 -f /Users/prasanna/work/apim/migration_2021/postgracesql/db_reg_version.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d user_2_5 -U root -h localhost -p 5434 -f /Users/prasanna/work/apim/migration_2021/postgracesql/db_reg_version.sql
cd wso2am-4.0.0-SNAPSHOT/bin
sh wso2server.sh -Dmigrate -Dcomponent=identity -DosgiConsole



