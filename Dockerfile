FROM ruby:2.7.5

ENV RACK_ENV=production

WORKDIR /app

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN gem install bundler -v 2.4.13

RUN bundle config set --local without "development test"

RUN bundle install --jobs 20 --retry 5

COPY . .

EXPOSE 9292

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]