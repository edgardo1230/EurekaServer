FROM openjdk:8-jdk-alpine
MAINTAINER edgardo.cruz@nearshoretechnology.com
ADD target/EurekaServer-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 1111
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]