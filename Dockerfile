FROM nvcr.io/nvidia/pytorch:20.09-py3

ADD . /workspace/
WORKDIR /workspace/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  openssh-server \
  openssl \
  gdb \
  rsync

# RUN conda env create -f environment.yml 
# RUN conda init bash
