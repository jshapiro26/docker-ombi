FROM ubuntu:16.04

WORKDIR /opt/Ombi

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt-get update &&\
    apt-get install -y wget\
    libunwind8\
    libicu55\
    liblttng-ust0\
    libcurl3\
    libssl1.0.0\
    libuuid1\
    libkrb5-3\
    zlib1g\
    locales &&\
    apt-get clean &&\
    wget https://ci.appveyor.com/api/buildjobs/lr8437akhr3tf9f2/artifacts/linux.tar.gz &&\
    tar xzf linux.tar.gz &&\
    chmod +x Ombi &&\
    locale-gen ${LANG} &&\
    mkdir -p /config

CMD ["./Ombi", "--storage", "/config"]
VOLUME ["/config"]
EXPOSE 5000

