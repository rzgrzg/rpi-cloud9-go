# ------------------------------------------------------------------------------

# Based on a work at https://github.com/docker/docker.

# ------------------------------------------------------------------------------

# Pull base image.

FROM arm32v7/node

MAINTAINER Hans Weggeman <hpweggeman@gmail.com>

CMD [ "node" ]

# ------------------------------------------------------------------------------
#Set locales
RUN apt-get update && apt-get install locales -y
RUN echo en_US.UTF-8 UTF-8 >>/etc/locale.gen && locale-gen
#Set time zone
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
# Get cloud9 source and install

RUN git clone https://github.com/c9/core.git /tmp/c9

RUN cd /tmp/c9 && scripts/install-sdk.sh

RUN mv /tmp/c9 /cloud9

WORKDIR /cloud9



# ------------------------------------------------------------------------------

# Add workspace volumes

RUN mkdir /cloud9/workspace

VOLUME /cloud9/workspace



# ------------------------------------------------------------------------------

# Set default workspace dir

ENV C9_WORKSPACE /cloud9/workspace



# ------------------------------------------------------------------------------

# Clean up APT when done.

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# ------------------------------------------------------------------------------

# Expose ports.

EXPOSE 8181

EXPOSE 3000

#FROM hwegge2/rpi-cloud9-ide

ENV GO_VERSION 1.12.4

RUN wget https://studygolang.com/dl/golang/go$GO_VERSION.linux-armv6l.tar.gz \
  &&tar -zxf go$GO_VERSION.linux-armv6l.tar.gz -C /usr/local/ &&rm -f go$GO_VERSION.linux-armv6l.tar.gz

ENV GOPATH /workspace
ENV GOROOT /usr/local/go
RUN echo "export PATH=$PATH:/usr/local/go/bin:/workspace/bin">>~/.bashrc
