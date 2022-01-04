# some comment (2)
FROM ubuntu
RUN apt-get update -y && \
	apt-get install -y wget && \
	wget https://github.com/gohugoio/hugo/releases/download/v0.89.2/hugo_0.89.2_Linux-64bit.tar.gz && \
	tar -xf hugo_0.89.2_Linux-64bit.tar.gz -C /usr/local/bin
COPY wiki /wiki
WORKDIR /wiki
RUN ls -lah
RUN hugo --gc --minify


FROM scratch
WORKDIR /assets
COPY robots.txt .
COPY --from=/wiki/public .
