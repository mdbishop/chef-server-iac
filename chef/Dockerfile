FROM ubuntu:trusty

MAINTAINER Lee Chang <leetchang@gmail.com>

ENV	DEBIAN_FRONTEND noninteractive
ENV CHEFPKGURL https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/chef_12.6.0-1_amd64.deb

RUN apt-get update && apt-get install -y curl && \
 curl -o chefpkg.deb -L $CHEFPKGURL && \
dpkg -i chefpkg.deb && \
apt-get clean && \
rm -rf chefpkg.deb /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE	443
