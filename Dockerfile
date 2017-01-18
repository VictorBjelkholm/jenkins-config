FROM jenkins:2.32.1
COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt | tr '\n' ' ')

USER root

RUN apt-get update

RUN apt-get install --yes netcat

RUN curl -sSL https://get.docker.com/ | sh

RUN usermod -aG docker jenkins

USER jenkins

EXPOSE 8080
EXPOSE 50000
