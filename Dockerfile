FROM ghcr.io/linuxserver/baseimage-ubuntu:jammy
LABEL maintainer='halfaider'
ARG FLASKFARM_DATA="/data"
ENV DEBIAN_FRONTEND="noninteractive" \
    FLASKFARM_REPO="https://github.com/flaskfarm/flaskfarm" \
    FLASKFARM_DATA="${FLASKFARM_DATA}" \
    FLASKFARM_SRC="${FLASKFARM_DATA}/src" \
    FLASKFARM_VENV="${FLASKFARM_DATA}/venv" \
    FLASKFARM_CONFIG="${FLASKFARM_DATA}/config.yaml" \
    FLASKFARM_RUNNING_TYPE="docker" \
    FLASKFARM_PORT="9999" \
    C_FORCE_ROOT="true"
COPY root/ /
EXPOSE 9999/tcp
VOLUME ["${FLASKFARM_DATA}"]