FROM hwegge2/rpi-cloud9-ide

ENV GO_VERSION 1.9.2

RUN curl -sL http://www.golangtc.com/static/go/$GO_VERSION/go$GO_VERSION.linux-armv6l.tar.gz \
  | tar xz -C /usr/local/ &&rm -f go$GO_VERSION.linux-armv6l.tar.gz

ENV GOPATH /workspace
ENV GOROOT /usr/local/go
RUN echo "export PATH=$PATH:/usr/local/go/bin:/workspace/bin">>~/.bashrc
