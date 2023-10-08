# Ansible test
FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get install -y software-properties-common curl git build-essential ansible && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS hampusek
RUN adduser --disabled-password --gecos '' hampusek
RUN adduser hampusek sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER hampusek
WORKDIR /home/hampusek

FROM hampusek
COPY . .
