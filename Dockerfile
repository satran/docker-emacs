FROM debian:stable

RUN apt-get -y update && \
    apt-get -y install ca-certificates emacs25 wget bzip2 git-core net-tools dnsutils curl httpie

COPY emacs-pkg-install.sh /root/install.sh
RUN /root/install.sh

#COPY site-lisp /root/.emacs.d/site-lisp
#COPY themes /root/.emacs.d/themes
#
#RUN wget http://golang.org/dl/go1.9.linux-amd64.tar.gz -q -O - | \
#    	 tar -zxf - -C /usr/local && \
#	 chmod -R a+rwx /usr/local/go
#
#RUN /usr/local/go/bin/go get -u github.com/rogpeppe/godef && \
#    /usr/local/go/bin/go get -u github.com/nsf/gocode && \
#    /usr/local/go/bin/go get -u golang.org/x/tools/cmd/goimports
#
#COPY init.el /root/.emacs.d/init.el
#
#USER $USER
ENV TERM=xterm-256color
ENTRYPOINT ["emacs"]
CMD ["-nw"]
