FROM fedora:23
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

RUN dnf  install -y make git gcc automake ncurses-devel.x86_64 && \
    git clone https://github.com/hishamhm/htop /usr/local/src/htop && \
    cd /usr/local/src/htop && ./autogen.sh && ./configure; make; make install && \
    rm -rf /usr/local/src/htop && \
    dnf remove -y make git gcc automake ncurses-devel.x86_64 && \
    rm -rf /var/cache/*
ENTRYPOINT /usr/local/bin/htop
