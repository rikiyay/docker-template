FROM ubuntu:18.04

LABEL maintainer="rikiya <rikiya@stanford.edu>"

USER root

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV SHELL=/bin/bash
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -yq --no-install-recommends \
    sudo \
    wget \
    curl \
    ca-certificates \
    build-essential \
    git \
    unzip \
    htop && \
    curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ARG CONDA_VERSION=py39_4.9.2

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -O miniconda.sh && \
    mkdir -p /opt && \
    /bin/bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh

COPY environment.yml /environment.yml
RUN pip install --upgrade pip && \
    conda update -n base conda -y && \
    conda env update

RUN mkdir ds
COPY run-jupyter.sh /ds/run-jupyter.sh
RUN chmod +x /ds/run-jupyter.sh

WORKDIR /ds

CMD [ "/bin/bash" ]