FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
ENV CONAN_HOOK_ERROR_LEVEL=30

RUN apt-get update -y && \
    apt-get install -y \
        autoconf \
        build-essential \
        cmake \
        git \
        libgl1-mesa-dev \
        pkg-config \
        python3 \
        python3-pip && \
    pip3 install conan && \
    conan config install https://github.com/conan-io/hooks.git && \
    conan config set hooks.conan-center

WORKDIR /usr/local/src
COPY conan-center-index conan-center-index
