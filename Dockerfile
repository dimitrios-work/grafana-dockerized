FROM debian:jessie

RUN apt-get update && \
	apt-get -y --no-install-recommends install curl libfontconfig ca-certificates && \
	apt-get clean && \
	curl https://grafanarel.s3.amazonaws.com/builds/grafana_3.1.1-1470047149_amd64.deb > /tmp/grafana.deb && \
	dpkg -i /tmp/grafana.deb && \
	rm /tmp/grafana.deb && \
	apt-get remove -y curl && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* && \
        groupmod -g 2000 grafana && \
        usermod -u 2000 -g 2000 grafana && \
        chown -R grafana /usr/share/grafana && \
	chown :grafana /etc/grafana/grafana.ini

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

CMD ["/etc/init.d/grafana-server", "start", "&&", "sleep", "infinity"]
