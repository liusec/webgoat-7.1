FROM java
MAINTAINER Grant Hunter (stu.guyu@gmail.com)

RUN apt-get update && \
    curl -o webgoat.jar https://s3.amazonaws.com/webgoat-war/webgoat-container-7.1-SNAPSHOT-war-exec.jar &&\
    echo '#!/bin/sh' > /run-webgoat && \
    echo "java -jar /webgoat.jar  -httpPort 8080" >>/run-webgoat && \
    chmod +x /run-webgoat

EXPOSE 8080
ENTRYPOINT ["/run-webgoat"]
