FROM ruby:2.3.1

RUN echo 'deb http://ftp.us.debian.org/debian jessie-backports main' >> /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
       build-essential \
       ffmpeg \
       imagemagick \
       libpq-dev \
       libqt4-webkit \
       libqt4-dev \
       libreoffice \
       libxml2-dev \
       libxslt1-dev \
       nodejs \
       unzip \
       wget \
       xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN wget http://projects.iq.harvard.edu/files/fits/files/fits-0.8.5.zip \
    && unzip fits-0.8.5.zip \
    && rm -rf fits-0.8.4 fits-0.8.5.zip \
    && chmod a+x fits-0.8.5/fits.sh

RUN mkdir /hydra-docker-demo
WORKDIR /hydra-docker-demo

ADD Gemfile /hydra-docker-demo/Gemfile
ADD Gemfile.lock /hydra-docker-demo/Gemfile.lock
RUN bundle install

ADD . /hydra-docker-demo

ENTRYPOINT ["/hydra-docker-demo/lib/support/docker/entrypoint.sh"]
CMD ["rails", "server"]
