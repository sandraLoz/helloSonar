FROM openjdk:19-jdk-alpine
ARG JAR_FILE=helloSonar-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]