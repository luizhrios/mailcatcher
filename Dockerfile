FROM ruby:3.0-alpine
MAINTAINER Samuel Cochran <sj26@sj26.com>

ARG VERSION=0.8.2

RUN apk add --no-cache build-base sqlite-libs sqlite-dev && \
    gem install mailcatcher -v $VERSION && \
    apk del --rdepends --purge build-base sqlite-dev

EXPOSE 1025 80

RUN printenv

CMD ["mailcatcher", "--foreground", "--ip", "0.0.0.0", "--http-port", "443"]
