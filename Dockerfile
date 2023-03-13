FROM openjdk:17.0-slim-buster

WORKDIR /clines

ENTRYPOINT ["java","-jar","-Xmx256m","/clines/app.jar"]

VOLUME ["/app/config"]

COPY target/*.jar /clines/app.jar