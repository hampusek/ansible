# Ansible test
FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS hampusek
ARG TAGS
#RUN addgroup --gid 1000 hampusek
#RUN adduser --gecos hampusek --uid 1000 --gid 1000 --disabled-password hampusek
RUN adduser --disabled-password --gecos '' hampusek
RUN adduser hampusek sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER hampusek
WORKDIR /home/hampusek

FROM hampusek
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
