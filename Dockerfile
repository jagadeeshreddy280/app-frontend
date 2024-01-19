FROM ubuntu:20.04
WORKDIR /app
COPY index.html .
RUN apt-get update
ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive

RUN  apt-get install -y \
    apache2 \
    wget \
    curl \
    vim \
    net-tools\
    apache2-utils

EXPOSE 80

RUN service apache2 start
RUN service apache2 stop
COPY index.html /var/www/html/
RUN service apache2 start

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
