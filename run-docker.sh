#! /bin/bash

set -ex

docker build -t ipfs/jenkins .

docker run --privileged -it \
	-p 8080:8080 \
	-p 50000:50000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(pwd):/var/jenkins_home \
	ipfs/jenkins
