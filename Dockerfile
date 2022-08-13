FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY src /app/src
COPY /pom.xml /app
RUN mvn -e -f /app/pom.xml clean package


FROM openjdk:11-jre-slim
WORKDIR /app/
COPY --from=build /app/target/hellodocker-0.0.1-SNAPSHOT.jar /app/hellodocker.jar
EXPOSE 9320
ENTRYPOINT ["java", "-jar", "/app/hellodocker.jar"]
