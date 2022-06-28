# FROM openjdk:19-jdk-alpine
# ARG JAR_FILE=helloSonar-0.0.1-SNAPSHOT.jar
# COPY ${JAR_FILE} app.jar
# ENTRYPOINT ["java", "-jar", "/app.jar"]


# Stage 1: compile a JAR file
FROM maven:3.6.3-jdk-13 as builder

# Copy local code to the container image.
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build a release artifact.
RUN mvn package -DskipTests

# Stage 2: run the previously built JAR file
FROM adoptopenjdk/openjdk13:alpine-slim

COPY --from=builder /app/target/hello-*.jar /hellosonar.jar

# Run the web service on container startup.
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-Dserver.port=8080","-jar","/hellosonar.jar"]