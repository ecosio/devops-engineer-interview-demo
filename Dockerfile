FROM ubuntu:20.04 

COPY target/app.jar $APP_HOME/app.jar 

RUN apt-get update && apt-get install -y openjdk-8-jdk  # Incorrect JDK version and unnecessary dependencies increase image size

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV APP_HOME=/app

EXPOSE 8080

USER root  # Security risk: Running as root user

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
