FROM alpine:latest as builder

MAINTAINER Subrahmanyam Raparti "rv.subrahmanyam1@gmail.com"

RUN wget -O activemq.tar.gz http://archive.apache.org/dist/activemq/5.14.3/apache-activemq-5.14.3-bin.tar.gz

RUN tar -xzf activemq.tar.gz -C /tmp/


FROM amazoncorretto:8

MAINTAINER Subrahmanyam Raparti "rv.subrahmanyam1@gmail.com"

COPY --from=builder /tmp ./

EXPOSE 8161 61616

CMD ["apache-activemq-5.14.3/bin/activemq", "console"]
