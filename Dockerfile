FROM ruby:2.7

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock /usr/src/app/
RUN bundle install

ADD metrics /usr/src/app/metrics
COPY main.rb models.rb LICENSE README.md /usr/src/app/
 
CMD ["ruby", "/usr/src/app/main.rb"]