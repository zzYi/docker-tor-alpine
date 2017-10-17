FROM alpine:latest

RUN echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.6/main" > /etc/apk/repositories && \
	echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.6/community" >> /etc/apk/repositories &&\
	echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/testing" >> /etc/apk/repositories &&\
	apk update

RUN apk add --no-cache tor go libc-dev git

ADD meek/meek-client/ /tor/meek-client/
ADD goptlib/ /root/go/src/git.torproject.org/pluggable-transports/goptlib.git/
ADD torrc /etc/tor/

RUN cd /tor/meek-client && go build &&\
	cp /tor/meek-client/meek-client /usr/bin/

RUN rm -rf /tor &&\
	apk del --no-cache go

EXPOSE 9050

#VOLUME "/var/lib/tor"
USER tor
CMD ["/usr/bin/tor"]
