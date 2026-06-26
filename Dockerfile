FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt update && apt install -y wget unzip

RUN wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.4.0/builds/463/downloads/velocity-3.4.0-463.jar

EXPOSE 8080

CMD ["java", "-jar", "velocity.jar"]
