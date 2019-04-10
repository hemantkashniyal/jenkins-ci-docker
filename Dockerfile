from jenkinsci/jenkins:2.150
MAINTAINER Hemant Kashniyal <hemantkashniyal@gmail.com>
 
ARG DOCKER_VERSION='18.09.1'

USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce=${DOCKER_VERSION}~ce-0~debian -y
RUN usermod -aG docker jenkins
