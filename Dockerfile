FROM ubuntu:trusty
MAINTAINER Sebastian Kempken
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install build-essential git

# Fetch imapsync source
RUN git clone git://github.com/imapsync/imapsync.git

# Install dependencies
RUN apt-get -y install makepasswd rcs perl-doc libmail-imapclient-perl libdigest-hmac-perl libterm-readkey-perl libio-socket-ssl-perl libdate-manip-perl libmail-imapclient-perl libfile-copy-recursive-perl libio-tee-perl

# Build it
RUN mkdir -p imapsync/dist
RUN cd imapsync && make install

# Define Entrypoint
ENTRYPOINT ["imapsync"]
