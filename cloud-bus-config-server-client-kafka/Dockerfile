FROM openjdk:24-jdk

EXPOSE 8080

COPY build/libs/cloud-bus-config-server-client-kafka-*.jar cloud-config-client.jar

CMD java -XX:FlightRecorderOptions=stackdepth=256 -jar cloud-config-client.jar
