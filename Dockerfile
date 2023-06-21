FROM ubuntu

RUN apt update && apt upgrade -y
RUN apt install git -y


WORKDIR /app

RUN apt install ruby-dev build-essential -y && \
	gem install rails

RUN git clone https://github.com/belmeetmule/homely-backend.git && cd homely-backend 

WORKDIR /app/homely-backend

RUN rm Gemfile && rm config/database.yml

COPY ./Gemfile .
COPY ./database.yml ./config/

# RUN cd backend


RUN  gem install bundler

RUN sed -i "s/ruby '3.1.2'/ruby '3.0.2'/" Gemfile && \
	apt install libpq-dev -y && \
	bundle install

RUN rm config/credentials.yml.enc
RUN	EDITOR=code rails credentials:edit



