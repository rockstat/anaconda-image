#https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/Dockerfile
FROM continuumio/anaconda3

ENV DEBIAN_FRONTEND=noninteractive
ARG conda=/opt/conda/bin/conda

ADD requirements.txt .

RUN apt-get -yqq update && apt-get -yqq install make gcc g++ coreutils
RUN pip install -U -r requirements.txt
RUN ${conda} install jupyter -y --quiet
