FROM registry.hub.docker.com/library/ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswresample-dev \
    libebur128-dev \
    libtag1-dev

RUN [ "mkdir", "-p", "loudgain/build" ]
COPY . loudgain
WORKDIR loudgain/build

RUN [ "cmake", ".." ]
RUN [ "make" ]
RUN [ "make", "install" ]

WORKDIR /
ENTRYPOINT [ "rgbpm" ]
CMD [ "Music" ]