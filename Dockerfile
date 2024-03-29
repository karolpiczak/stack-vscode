FROM nvcr.io/nvidia/pytorch:23.02-py3

ADD . /workspace/
WORKDIR /workspace/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  byobu \
  ffprobe \
  gdb \
  htop \
  language-pack-en \
  libncurses5 \
  libncursesw5 \
  locales \
  locales-all \
  man-db \
  net-tools \
  openssh-server \
  openssl \
  python3 \
  quota \
  rsync \
  rsyslog \
  sshfs \
  wget \
  unzip \
  zsh

RUN locale-gen && \
  mkdir /var/run/sshd && \
  chmod 755 /usr/local/share/zsh && \
  chmod 755 /usr/local/share/zsh/site-functions

RUN mkdir /usr/share/fonts/googlefonts && \
  wget -O /usr/share/fonts/googlefonts/nunito.zip https://github.com/googlefonts/nunito/archive/main.zip && \
  unzip -d /usr/share/fonts/googlefonts/ /usr/share/fonts/googlefonts/nunito.zip && \
  chmod -R --reference=/usr/share/fonts/truetype /usr/share/fonts/googlefonts && \
  fc-cache -fv
  
