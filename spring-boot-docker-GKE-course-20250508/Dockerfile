# 簡單的 Spring Boot Dockerfile
# 這個 Dockerfile 是用來構建一個 Spring Boot 應用的 Docker 映像
FROM eclipse-temurin:17-jdk-focal


WORKDIR /app

ADD target/spring-boot-docker-0.0.1-SNAPSHOT.jar /app/spring-boot-docker-0.0.1-SNAPSHOT.jar


ENTRYPOINT ["java","-jar","spring-boot-docker-0.0.1-SNAPSHOT.jar"]