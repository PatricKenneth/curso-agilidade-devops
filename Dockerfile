FROM openjdk:17.0-slim-buster

WORKDIR /clines

COPY target/*.jar /clines/app.jar

EXPOSE 8080

CMD java -XX:+UseContainerSupport -Xmx512m -jar app.jar --server.port=$PORT