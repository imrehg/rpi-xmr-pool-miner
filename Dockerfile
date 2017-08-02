FROM resin/raspberrypi3-debian:stretch AS build

WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get install -qy \
      automake \
      build-essential \
      libssl-dev \
      libcurl4-openssl-dev \
      libjansson-dev \
      git

RUN    git clone https://github.com/lucasjones/cpuminer-multi.git \
    && cd cpuminer-multi \
    && ./autogen.sh \
    && ./configure CFLAGS="-O3 -mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits" \
    && make -j

FROM resin/raspberrypi3-debian:stretch
WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get install -qy \
      libssl1.1 \
      libjansson4

COPY --from=build /usr/src/app/cpuminer-multi/minerd /usr/bin/

COPY start.sh ./
CMD ["bash", "start.sh"]
