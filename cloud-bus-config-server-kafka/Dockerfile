FROM openjdk:24-jdk

EXPOSE 8081

COPY build/libs/cloud-bus-config-server-kafka-*.jar cloud-config-server.jar

CMD java -XX:FlightRecorderOptions=stackdepth=256 -jar cloud-config-server.jar