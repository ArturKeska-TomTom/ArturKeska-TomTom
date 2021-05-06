#!/bin/bash

module="$1"
if [ ! -z $module ]
then
    what="$module/pom.xml"
else
    what=coredb-services-devel/pom.xml
fi

echo "Compiling module $what" 

mvn -f ${what} clean install -Pdev,full,deploy-with-ttom,dev-toggles -Dmaven.test.skip -Dmaven.javadoc.skip tomcat7:deploy-only -Dalt.resources.dir="/home/keska/proj/coredb/coredb-services-devel/dev-resources/" -DvalidateInterface.skip=ALL

#mvn -f ${what} clean install -Pdev,full,deploy-with-ttom,dev-toggles -Dmaven.test.skip -Dmaven.javadoc.skip  -Dalt.resources.dir="/home/keska/proj/coredb/coredb-services-devel/dev-resources/" -DvalidateInterface.skip=ALL

#mvn -f ${what} clean install -Pdev,handler-plugins,full,dev-toggles,togglable-feature,deploy-with-ttom -Dmaven.test.skip -Dmaven.javadoc.skip -DvalidateInterface.skip=ALL -Dalt.resources.dir=/home/keska/proj/coredb/coredb-services-devel/dev-resources/
