FROM ubuntu:13.10

MAINTAINER Lytics (createdby Esniff)

# Add wget and some other helpful tools.
RUN apt-get update
RUN apt-get install -y wget gcc make g++ build-essential ca-certificates mercurial git bzr libsqlite3-dev sqlite3

# Add support for GO
RUN wget https://go.googlecode.com/files/go1.2.src.tar.gz && tar zxvf go1.2.src.tar.gz && cd go/src && ./make.bash
ENV PATH $PATH:/go/bin:/gocode/bin
ENV GOPATH /gocode

#Install Drone.io
EXPOSE 8080 
RUN wget http://downloads.drone.io/latest/drone.deb
RUN dpkg -i drone.deb
ENTRYPOINT ["/usr/local/bin/droned"]


