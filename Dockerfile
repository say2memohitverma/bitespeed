FROM ruby:3.0.0

ADD . /bitespeed
WORKDIR /bitespeed
RUN bundle install

EXPOSE 3000

CMD ["bash"]