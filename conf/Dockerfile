FROM httpd

MAINTAINER ki-ri 

RUN apt-get update \
  && apt-get install -y --no-install-recommends libapache2-mod-jk \
  && rm -r /var/lib/apt/lists/*  \
  && mkdir -p /var/log/apache2
