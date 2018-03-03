FROM phusion/baseimage:0.10.0

ENV INSTALL_PATH /app

CMD ["/sbin/my_init", "--skip-startup-files"]

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      python \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH


RUN mkdir /etc/service/server
RUN printf "#\041/bin/bash\n\
set -x\n\
cd /app\n\
exec /usr/bin/python -m SimpleHTTPServer \044PORT\n\
" > /etc/service/server/run
RUN chmod +x /etc/service/server/run


COPY . /app