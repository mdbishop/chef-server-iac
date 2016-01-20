FROM ubuntu:trusty

MAINTAINER Lee Chang <leetchang@gmail.com>

ENV	DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl

RUN curl -o chef-server.deb -L https://packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.3.1-1_amd64.deb/download
RUN dpkg -i chef-server.deb
RUN	dpkg-divert --local --rename --add /sbin/initctl

RUN	ln -sf /bin/true /sbin/initctl
RUN	/opt/opscode/embedded/bin/runsvdir-start & \
	chef-server-ctl reconfigure && \
	chef-server-ctl stop

RUN apt-get clean
RUN rm -rf chef-server.deb /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY	. /usr/local/bin/
CMD	["run_chef_server"]

EXPOSE	443
