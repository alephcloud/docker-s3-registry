FROM ubuntu:12.04
MAINTAINER Pablo Delgado <pdelgado@opentable.com>

RUN apt-get update
RUN apt-get install -y git redis-server build-essential python-dev libevent-dev python-pip liblzma-dev supervisor

ADD src/ /tmp/
RUN /tmp/install.sh

EXPOSE 5000
CMD ["/usr/bin/supervisord"]
