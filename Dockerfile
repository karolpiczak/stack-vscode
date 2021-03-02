FROM nvcr.io/nvidia/pytorch:20.09-py3

ADD . /workspace/
WORKDIR /workspace/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  byobu \
  gdb \
  htop \
  language-pack-en \
  locales \
  locales-all \
  man-db \
  net-tools \
  openssh-server \
  openssl \
  python3 \
  rsync \
  rsyslog \
  zsh

RUN locale-gen && \
    mkdir /var/run/sshd && \
    chmod 755 /usr/local/share/zsh && \
    chmod 755 /usr/local/share/zsh/site-functions

# RUN conda env create -f environment.yml 
# RUN conda init bash
