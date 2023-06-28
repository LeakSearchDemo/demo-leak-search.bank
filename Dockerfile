# syntax=docker/dockerfile:1
# Dockerfile for demo.leak-search.com 
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
COPY src ./src
ENV INTERNAL_HOST=$LS_HOST

CMD ["./mvnw", "spring-boot:run"]
