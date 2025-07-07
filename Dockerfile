FROM 381841683508.dkr.ecr.eu-west-1.amazonaws.com/bse-java:21

EXPOSE 8080

COPY build/libs/zalando-partner-connector-*.jar app.jar

CMD java -javaagent:agent.jar -XX:FlightRecorderOptions=stackdepth=256 -jar app.jar
