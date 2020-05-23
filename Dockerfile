FROM alpine:3.10
MAINTAINER Julien Delange <julien@code-inspector.com>

RUN apk add python3
RUN pip3 install code-inspector

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]