FROM ruby:2.7.1-alpine

ARG GITHUB_PAGES_VERSION=214

WORKDIR /opt/app

RUN  set -x \
  && apk add --no-cache --virtual deps \
    build-base \
  && apk add --no-cache \
    imagemagick \
    libffi \
  && gem install \
    github-pages -v ${GITHUB_PAGES_VERSION} \
  && apk del deps

CMD [ "jekyll", "serve", "-H", "0.0.0.0" ]
