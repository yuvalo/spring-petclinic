FROM openjdk:10

RUN export
WORKDIR /app

COPY target/*.jar ./

