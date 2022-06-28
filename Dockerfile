FROM openjdk:19-jdk-alpine
ARG JAR_FILE=target/hellosonar-1.0.0.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]