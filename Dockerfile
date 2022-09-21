FROM alpine

ENV CLIENT 0.0.0.0:9001
ENV SERVER 0.0.0.0:9003

RUN apk update \
    && apk upgrade \
    && apk --no-cache add curl

RUN curl -LO https://xdebug.org/files/binaries/dbgpProxy \
    && chmod +x ./dbgpProxy

EXPOSE 9001 9003

CMD ./dbgpProxy --server ${SERVER} --client ${CLIENT}
