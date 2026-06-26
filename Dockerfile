FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt update && apt install -y wget jq

RUN VELOCITY_VERSION=$(curl -s https://api.papermc.io/v2/projects/velocity | jq -r '.versions[-1]') && \
    VELOCITY_BUILD=$(curl -s https://api.papermc.io/v2/projects/velocity/versions/$VELOCITY_VERSION | jq -r '.builds[-1]') && \
    wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/$VELOCITY_VERSION/builds/$VELOCITY_BUILD/downloads/velocity-$VELOCITY_VERSION-$VELOCITY_BUILD.jar

EXPOSE 8080

CMD ["java", "-Xmx512M", "-jar", "velocity.jar"]FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt update && apt install -y wget unzip

RUN wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.4.0/builds/471/downloads/velocity-3.4.0-471.jar

RUN echo "online-mode=false" > velocity.toml

EXPOSE 8080

CMD ["java", "-Xmx512M", "-jar", "velocity.jar"]
