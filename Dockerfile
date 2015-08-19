FROM phusion/baseimage
MAINTAINER Qingping Hou "qihou@linkedin.com"

RUN apt-get update
RUN apt-get install -y build-essential linux-headers-generic tar xz-utils \
		zlib1g-dev libbz2-dev libssl-dev libncursesw5-dev libreadline-gplv2-dev \
		tk-dev libsqlite3-dev libc6-dev libgdbm-dev libexpat-dev

WORKDIR /root

ENV PY_VER 2.6.9
ENV ST_VER 1.4.2

RUN curl -sL -o python.tar.xz \
		http://www.python.org/ftp/python/$PY_VER/Python-$PY_VER.tar.xz
RUN tar xJf python.tar.xz && mv Python-$PY_VER python

RUN curl -sL -o setuptools-$ST_VER.tar.gz \
		https://pypi.python.org/packages/source/s/setuptools/setuptools-$ST_VER.tar.gz
RUN tar xzf setuptools-$ST_VER.tar.gz && mv setuptools-$ST_VER setuptools

ADD ./scripts/build-python.sh /root/build-python.sh
RUN bash build-python.sh

RUN rm -rf /root/*
RUN apt-get clean
