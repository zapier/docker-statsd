FROM ubuntu:14.04
RUN apt-get update && apt-get -y install software-properties-common
RUN sudo apt-add-repository -y ppa:chris-lea/node.js
RUN apt-get update && apt-get -y install wget git python nodejs
RUN git clone git://github.com/etsy/statsd.git statsd

ADD ./config.js ./statsd/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD /statsd/bin/statsd /statsd/config.js
