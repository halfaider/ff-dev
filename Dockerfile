FROM ghcr.io/linuxserver/baseimage-ubuntu:jammy
LABEL maintainer='halfaider'
ARG FF_DATA="/data"
ENV DEBIAN_FRONTEND="noninteractive" \
    FF_DATA="${FF_DATA}"
COPY root/ /
EXPOSE 9999/tcp
VOLUME ["${FF_DATA}"]