#!/bin/bash

mkdir -p /root/tomcat/webapps /root/tomcat/logs /root/tomcat/conf
docker run --name tomcat -p 8080:9090 -v /root/tomcat/webapps/:/usr/local/tomcat/webapps/ -d tomcat
