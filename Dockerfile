FROM phusion/baseimage:0.10.0

ENV INSTALL_PATH /app

CMD ["/sbin/my_init", "--skip-startup-files"]

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY . /app

RUN mkdir /etc/service/server
RUN printf "#\041/bin/bash\n\
set -x\n\
cd /app\n\
exec /usr/bin/python -m SimpleHTTPServer $PORT\n\
" > /etc/service/server/run
RUN chmod +x /etc/service/server/run