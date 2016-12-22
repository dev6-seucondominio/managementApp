FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

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
