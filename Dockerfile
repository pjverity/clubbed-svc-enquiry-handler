FROM openjdk:11-jre-slim-sid

COPY /target/maven-archiver/pom.properties /pom.properties
RUN . /pom.properties

ARG artifactId=${artifactId}
ARG version=${version}

ENV ARTIFACT ${artifactId}-${version}.jar

EXPOSE 8080

COPY /target/${ARTIFACT} /opt/${ARTIFACT}

CMD java -Xms50m -Xmx100m \
    -Dspring.config.additional-location=file:/etc/config/ \
    -Duser.timezone=UTC \
    -jar /opt/${ARTIFACT}
