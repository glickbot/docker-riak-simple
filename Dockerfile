FROM ubuntu
MAINTAINER Jon Glick jglick@basho.com
RUN apt-get update && apt-get install -y curl supervisor
RUN curl https://packagecloud.io/install/repositories/basho/riak/script.deb | bash
RUN apt-get install -y riak=2.0.5-1
COPY riak.conf /etc/riak/riak.conf
COPY rc.local /etc/rc.local
COPY supervisor.conf /etc/supervisor/conf.d/docker-riak.conf
RUN echo "ulimit -n 65536" > /etc/default/riak
EXPOSE 8087 8098
CMD ["/usr/bin/supervisord", "-n"]
