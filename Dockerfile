FROM ruby
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /src
WORKDIR /src
COPY Gemfile /src/Gemfile
COPY Gemfile.lock /src/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /src

CMD ["rails", "server", "-b", "0.0.0.0"]