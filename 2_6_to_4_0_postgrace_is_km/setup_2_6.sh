#Clean the existing packs
rm -fr wso2is-km-5.7.0
rm -fr wso2am-2.6.0
#Create database containers
cd /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_2.6/apim
docker-compose up -d
cd /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_2.6/reg
docker-compose up -d
cd /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/db_2.6/user
docker-compose up -d
#Populate database scripts
cd /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/
unzip wso2am-2.6.0.zip
unzip wso2is-km-5.7.0.zip
PGPASSWORD=root
export PGPASSWORD
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d apim_2_6 -U root -h localhost -p 5435 -f /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/wso2is-km-5.7.0/dbscripts/apimgt/postgresql.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d reg_2_6 -U root -h localhost -p 5436 -f /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/wso2is-km-5.7.0/dbscripts/postgresql.sql
/Applications/pgAdmin\ 4.app/Contents/SharedSupport/psql -d user_2_6 -U root -h localhost -p 5437 -f /Users/prasanna/work/apim/migration_2021/2_6_to_4_0_postgrace_is_km/wso2is-km-5.7.0/dbscripts/postgresql.sql
#Copy configs iskm
cp iskm_master-datasources.xml wso2is-km-5.7.0/repository/conf/datasources/master-datasources.xml
cp iskm_user-mgt.xml wso2is-km-5.7.0/repository/conf/user-mgt.xml
cp iskm_registry.xml wso2is-km-5.7.0/repository/conf/registry.xml
cp iskm_carbon.xml wso2is-km-5.7.0/repository/conf/carbon.xml
#Copy configs apim
cp apim_master-datasources.xml wso2am-2.6.0/repository/conf/datasources/master-datasources.xml
cp apim_user-mgt.xml wso2am-2.6.0/repository/conf/user-mgt.xml
cp apim_registry.xml wso2am-2.6.0/repository/conf/registry.xml
#Copy db drivers
cp postgresql-42.2.18.jar wso2am-2.6.0/repository/components/lib/
cp postgresql-42.2.18.jar wso2is-km-5.7.0/repository/components/lib/
#Copy IS KM apimanager xml
cp iskm_api-manager.xml wso2is-km-5.7.0/repository/conf/api-manager.xml
#Copy AM api manager xml
cp apim_api-manager.xml wso2am-2.6.0/repository/conf/api-manager.xml



