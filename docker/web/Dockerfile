FROM ruby:3.2.2

ENV LANG C.UTF-8
ENV APP_ROOT /app
ENV BUNDLE_JOBS 4
ENV BUNDLER_VERSION 2.3.14

RUN apt-get update

RUN apt-get -y install vim

#####for-develop######
# rails-erd
# RUN apt-get -y install ruby-graphviz
#####for-develop######

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle -v
RUN bundle install

COPY . $APP_ROOT
VOLUME ["/app"]

# Add a script to be executed every time the container starts.
COPY ./docker/web/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
CMD ["sh", "/usr/bin/entrypoint.sh"]
