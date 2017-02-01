FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y locales build-essential
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# for redis
RUN apt-get install -y redis-server

# for postgres
RUN apt-get install -y libpq-dev postgresql-client

# for a JS runtime
RUN apt-get install -y nodejs

ENV ERP /erp
RUN mkdir $ERP
WORKDIR $ERP

ADD Gemfile* $ERP/

ENV BUNDLE_GEMFILE=$ERP/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install

ADD . $ERP
