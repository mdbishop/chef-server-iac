FROM ubuntu:trusty

MAINTAINER Lee Chang <leetchang@gmail.com>

ENV	DEBIAN_FRONTEND noninteractive
ENV CHEFPKGURL https://packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.3.1-1_amd64.deb/download

RUN apt-get update && apt-get install -y curl && \
	curl -o chef-server.deb -L $CHEFPKGURL && \
	dpkg -i chef-server.deb && \
	dpkg-divert --local --rename --add /sbin/initctl && \
	ln -sf /bin/true /sbin/initctl && \

RUN /opt/opscode/embedded/bin/runsvdir-start & \
	chef-server-ctl reconfigure && \
	chef-server-ctl stop

RUN apt-get clean && \
	rm -rf chef-server.deb /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY	. /usr/local/bin/

CMD	["run_chef_server"]

EXPOSE	443
