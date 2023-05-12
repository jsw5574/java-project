FROM tomcat:8.5-jdk8

## Asia/Seoul Timcezone 설정 

RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

COPY /home/runner/work/java-project/java-project/target/*.war /usr/local/tomcat/webapps/ROOT.war
#EXPOSE 8080
CMD $CATALINA_HOME/bin/shutdown.sh
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out



## war refresh ##
#RUN rm -rf /usr/local/tomcat/webapps/*
#COPY ./target/*.war ./tomcat/webapps/ROOT.war
