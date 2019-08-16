```
FROM ruby:2.6.3-alpine

# Env
ENV APP_HOME /app
ENV RAILS_ENV='development'
ENV IMAGE_PACKAGES tzdata imagemagick
ENV BUILD_PACKAGES build-base ruby-dev libc-dev openssl linux-headers libxslt-dev git curl yarn
ENV RUBY_PACKAGES nodejs libxml2-dev postgresql-dev

run apk update && \
    apk upgrade && \
    apk add ca-certificates $IMAGE_PACKAGES && \
    apk add --virtual .builddeps $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

# Create and switch to app_home dir
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install gems.
COPY Gemfile* $APP_HOME/
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the rest of the app
COPY . $APP_HOME

# Provide a Healthcheck for Docker risk mitigation
HEALTHCHECK --interval=3600s --timeout=20s --retries=2 CMD curl http://localhost:3000 || exit 1

# Define an entrypoint for default
ENTRYPOINT ["bundle", "exec"]

# Default command, running app as a service
CMD ["rails", "server", "-b", "0.0.0.0"]
```
