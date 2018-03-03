FROM phusion/baseimage:0.10.0

ENV INSTALL_PATH /app

CMD ["/sbin/my_init"]

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY . /app