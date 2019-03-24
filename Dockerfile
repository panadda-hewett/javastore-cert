FROM openjdk:9-jdk-slim as addcert
COPY certificates /usr/local/share/ca-certificates/certificates
COPY certificates .
RUN apt-get update && apt-get install --no-install-recommends -y -qq ca-certificates-java && \
         update-ca-certificates

FROM openjdk:9-jdk-slim
COPY --from=addcert cacert.cer .

RUN keytool -noprompt -storepass changeit -import -file cacert.cer -alias Example_CA

RUN groupadd --gid 1000 java &&\
    useradd --uid 1000 --gid java --shell /bin/bash --create-home java && \
    chmod -R a+w /home/java
WORKDIR /home/java
