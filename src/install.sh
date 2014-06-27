#!/bin/bash

set -e
set -x

git clone https://github.com/dotcloud/docker-registry.git /opt/docker-registry
cd /opt/docker-registry
git checkout 0.7.3

mv /tmp/config.yml /opt/docker-registry/config/config.yml

pip install -r requirements.txt
pip install .

mv /tmp/supervisord.conf     /etc/supervisor/
mv /tmp/redis-server.conf    /etc/supervisor/conf.d/
mv /tmp/docker-registry.conf /etc/supervisor/conf.d/
