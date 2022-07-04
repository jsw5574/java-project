FROM centos:7

# openjdk1.8. 설치
RUN mkdir -p /apps && mkdir -p /bin && mkdir -p /src

WORKDIR /apps
RUN yum update -y
RUN yum install wget -y
RUN yum list java-1.8.0-openjdk-devel.x86_64RUN yum install java-1.8.0-openjdk-devel.x86_64 -y# RUN which javac# 
RUN readlink -f /usr/bin/java

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.232.b09-0.el7_7.x86_64
RUN java -version
RUN cd /apps
RUN echo "java install complete"

# Tomcat 설치
RUN wget http://mirror.apache-kr.org/tomcat/tomcat-7/v7.0.100/bin/apache-tomcat-7.0.100.tar.gz
RUN tar -xvf apache-tomcat-7.0.100.tar.gzRUN mv apache-tomcat-7.0.100 /apps/tomcat
ENV CATALINA_HOME=/apps/tomcat
ENV CATALINA_BASE=/apps/tomcat
ENV JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64
RUN echo "tomcat install complete"


EXPOSE 8080
# WORKDIR /app/tomcat/bin
CMD ["/apps/tomcat/bin/catalina.sh", "run"]
