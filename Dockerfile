FROM ubuntu
MAINTAINER Jon Glick jglick@basho.com
RUN apt-get update
RUN apt-get install -y curl supervisor
RUN curl https://packagecloud.io/install/repositories/basho/riak/script.deb | bash
RUN apt-get install -y riak=2.0.2-1
COPY riak.conf /etc/riak/riak.conf
COPY rc.local /etc/rc.local
COPY supervisor.conf /etc/supervisor/conf.d/docker-riak.conf
EXPOSE 8087 8098
CMD ["/usr/bin/supervisord", "-n"]
