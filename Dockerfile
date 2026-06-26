FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt update && apt install -y wget curl jq

RUN VERSION=$(curl -s https://api.papermc.io/v2/projects/velocity | jq -r '.versions[-1]') && \
    BUILD=$(curl -s https://api.papermc.io/v2/projects/velocity/versions/$VERSION | jq -r '.builds[-1]') && \
    wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/$VERSION/builds/$BUILD/downloads/velocity-$VERSION-$BUILD.jar

EXPOSE 8080

CMD ["java", "-Xmx512M", "-jar", "velocity.jar"]
