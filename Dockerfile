FROM debian:11

COPY init /opt/init
RUN bash /opt/init/init.sh

CMD ["/bin/bash", "-l"]
