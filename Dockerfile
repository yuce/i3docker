FROM ubuntu:xenial
MAINTAINER Yuce Tekol <yucetekol@gmail.com>

ENV I3VERSION 4.13
ENV PREFIX /opt/i3-$I3VERSION
WORKDIR /
VOLUME ["/tmp/", "/opt/"]

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libxcb1-dev libxcb-keysyms1-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
    libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-xinerama0-dev libpango1.0-dev \
    libxcursor-dev libxcb-cursor-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
    xutils-dev autoconf pkg-config git

COPY ./src/build.sh /build.sh

ENTRYPOINT ["/bin/bash", "/build.sh"]
CMD ["4.13"]