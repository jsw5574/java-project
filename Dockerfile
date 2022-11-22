From sjapp:latest

WORKDIR /apps/
RUN rm -rf ./tomcat/webapps/*
COPY ./target/*.war ./tomcat/webapps/ROOT.war
EXPOSE 8080
CMD $CATALINA_HOME/bin/shutdown.sh
CMD $CATALINA_HOME/bin/startup.sh && tail -f $CATALINA_HOME/logs/catalina.out
