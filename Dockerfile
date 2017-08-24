FROM debian:jessie
MAINTAINER Alexis Pereda <alexis@pereda.fr>

RUN echo>/etc/apt/sources.list.d/stretch.list 'deb http://httpredir.debian.org/debian stretch main'
RUN echo>>/etc/apt/preferences 'Package: *'
RUN echo>>/etc/apt/preferences 'Pin: release a=testing'
RUN echo>>/etc/apt/preferences 'Pin-Priority: 100'

RUN apt update
RUN apt install -y inotify-tools gnupg=1.4.18-7+deb8u3
RUN apt install -y -tstretch aptly
RUN rm -rf /var/lib/apt/lists/*

COPY aptly.conf /etc/aptly.conf
COPY bin /usr/local/bin

WORKDIR /opt/aptly

VOLUME ["/opt/aptly"]
VOLUME ["/shared"]
ENTRYPOINT ["start"]
