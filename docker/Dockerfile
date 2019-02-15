FROM baseimage

LABEL maintainer="Hualet Wang<mr.asianwang@gamil.com>"
LABEL description="deepin unstable common builder docker image."

RUN apt update && \
    apt --fix-broken install -y && \
    apt dist-upgrade -y
RUN apt install build-essential \
    qt5-default qt5-qmake qtbase5-dev \
    valac -y