FROM ruby:2.5-alpine

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    mkdir -p /usr/src/myapp

WORKDIR /usr/src/myapp

COPY Gemfile ./
RUN gem install bundler -v 2.3.27
RUN bundle config build.nokogiri --use-system-libraries && \
    bundle install

COPY . ./
RUN chmod +x bin/rails

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["rails", "s", "-b", "0.0.0.0"]
