# srt-xtransmit - https://github.com/maxsharabayko/srt-xtransmit
#
#

FROM        alpine:3.13 AS base

RUN         apk add --no-cache --update ca-certificates libstdc++

######################
# Build srt-xtransmit.
FROM    base AS build

RUN     apk add --no-cache --update linux-headers curl cmake make g++ openssl-dev
RUN     apk add --update git tcl pkgconfig libressl-dev build-base

ENV     TMPDIR=/tmp/srtx

RUN \
    mkdir ${TMPDIR} && \
    cd ${TMPDIR} && \
    git clone https://github.com/maxsharabayko/srt-xtransmit.git srt-xtransmit && \
    cd srt-xtransmit && \
    git submodule init && \
    git submodule update && \
    mkdir _build && \
    cd _build && \
    cmake .. && \
    cmake --build . && \
    mv bin/* /usr/local/bin/ && \
    rm -rf ${TMPDIR}

##########################
# Build the release image.
FROM        base AS release

ENV         LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64

COPY --from=build /usr/local /usr/local
