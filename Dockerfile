FROM debian:latest
MAINTAINER Alexis Pereda <alexis@pereda.fr>

RUN apt update
RUN apt install -y aptly inotify-tools gnupg
RUN rm -rf /var/lib/apt/lists/*

COPY aptly.conf /etc/aptly.conf
COPY start /usr/local/bin/
COPY repo-create /usr/local/bin/

WORKDIR /opt/aptly

VOLUME ["/opt/aptly"]
VOLUME ["/shared"]
ENTRYPOINT ["start"]
