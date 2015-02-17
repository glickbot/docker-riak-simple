docker-riak-simple
==========

### Notes
This is a docker image for a lightweight instance of Riak

* n_val = 1
* ring size = 16
* no AAE
* no Search
* Riak Control enabled ( for clustering )

Modify riak.conf if you'd like to change your configuration.

I use boot2docker, ymmv

### Usage

##### Building

Build the Docker image

	docker build -t "glickbot/riak-simple" .

##### Running

Run the Docker image

	~ $ docker -d -P glickbot/riak-simple
	123456789...
	
	~ $ docker port 1234
	8087/tcp -> 0.0.0.0:49171
	8098/tcp -> 0.0.0.0:49172
	
	#(linux)
	~ $ xdg-open "http://localhost:49172/admin"
	
	#(osx)
	~ $ open "http://$(boot2docker ip):49172/admin"

##### Clustering

* Run two or more glickbot/riak-simple containers
* Use Riak Control to join nodes together