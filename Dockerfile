FROM centos:7

# openjdk1.8. 설치
RUN mkdir -p /apps &&  mkdir -p /src

WORKDIR /apps
RUN yum update -y
RUN yum install wget -y
RUN yum install ld-linux.so.2 -y

# openjdk-install#

RUN cd /apps
RUN wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk-jre/8u352-b08/openlogic-openjdk-jre-8u352-b08-linux-x32.tar.gz
RUN tar zxvf openlogic-openjdk-jre-8u352-b08-linux-x32.tar.gz
RUN ln -s /apps/openlogic-openjdk-jre-8u352-b08-linux-x32/bin/java /usr/bin/java
#RUN which javac 

ENV JAVA_HOME=/apps/openlogic-openjdk-jre-8u352-b08-linux-x32
RUN echo $JAVA_HOME
RUN java -version
RUN echo "java install complete"

# Tomcat 설치
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83.tar.gz
RUN tar zxvf apache-tomcat-8.5.83.tar.gz
RUN mv apache-tomcat-8.5.83 /apps/tomcat
ENV CATALINA_HOME=/apps/tomcat
ENV CATALINA_BASE=/apps/tomcat
RUN echo "tomcat install complete"


WORKDIR /apps/
RUN rm -rf ./tomcat/webapps/*
COPY ./target/*.war ./tomcat/webapps/ROOT.war
EXPOSE 8080
CMD $CATALINA_HOME/bin/shutdown.sh
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out
