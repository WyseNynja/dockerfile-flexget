# TODO: FROM that works with docker hub
FROM gitlab.stytt.com:5001/docker/python3/ubuntu

ENTRYPOINT ["/entrypoint.sh"]

RUN { set -eux; \
	\
	docker-install locales; \
    dpkg-reconfigure locales; \
    locale-gen en_US.UTF-8; \
    /usr/sbin/update-locale LANG=en_US.UTF-8; \
}
ENV LC_ALL en_US.UTF-8

USER abc
WORKDIR /home/abc

RUN mkdir -p /home/abc/.flexget /home/abc/watch/nzb /home/abc/watch/torrent

VOLUME /home/abc/.flexget /home/abc/watch/nzb /home/abc/watch/torrent

RUN pip install flexget==2.12.3

# TODO: keep config.yml out of the named volume
COPY config.yml /home/abc/

ADD entrypoint.sh /
