FROM tomcat:8.5-jdk8

## Asia/Seoul Timcezone 설정 

RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime


## war refresh ##
#RUN rm -rf /usr/local/tomcat/webapps/*
#COPY ./target/*.war ./tomcat/webapps/ROOT.war
