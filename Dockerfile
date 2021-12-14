# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "Siham@gmail.com">

# Copy to images tomcat path
ADD target/account-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/





