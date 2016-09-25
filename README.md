# grafana-dockerized

docker build --tag "grafana/grafana:home-baked" --no-cache=true .
docker run -d --name grafana -p 3000:3000 -v /grafana/:/var/lib/grafana/:rw -v /grafana/logs/:/var/log/grafana/:rw grafana/grafana:home-baked
docker run -it grafana/grafana:home-baked /bin/bash
