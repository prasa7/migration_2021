rm -fr wso2am-4.0.0-SNAPSHOT/migration-resources
cp -r migration-resources-apim wso2am-4.0.0-SNAPSHOT/migration-resources
rm -fr wso2am-4.0.0-SNAPSHOT/repository/components/dropins/org.wso2.carbon.is.migration*
rm -fr wso2am-4.0.0-SNAPSHOT/repository/components/dropins/org.wso2.carbon.apimgt.migrate*
rm -fr wso2am-4.0.0-SNAPSHOT/repository/components/lib/org.wso2.carbon.apimgt.migrate*
cp org.wso2.carbon.apimgt.migrate.client-4.0.0.jar wso2am-4.0.0-SNAPSHOT/repository/components/dropins/
cd wso2am-4.0.0-SNAPSHOT/bin/
sh wso2server.sh -DmigrateFromVersion=2.5.0 -DosgiConsole
