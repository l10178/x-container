# http proxy setting
ARG HTTP_PROXY=
ARG HTTPS_PROXY=
ARG NO_PROXY="localhost,127.0.0.1"

FROM debian:stable-slim
# set http proxy,some use lowercase, while some uppercase
ENV http_proxy=${HTTP_PROXY}
ENV https_proxy=${HTTPS_PROXY}
ENV HTTP_PROXY=${HTTP_PROXY}
ENV HTTPS_PROXY=${HTTPS_PROXY}
ENV no_proxy=${NO_PROXY}
ENV NO_PROXY=${NO_PROXY}

WORKDIR /opt
# Ensure apt-get won't prompt for selecting options
ENV DEBIAN_FRONTEND=noninteractive

ENV SDKMAN_DIR=/opt/sdkman
RUN <<EOF
#!/usr/bin/env bash
set -e
apt-get update
apt-get install -y --no-install-recommends ca-certificates curl zip unzip tini libjemalloc2
curl 'https://get.sdkman.io' | bash
source ${SDKMAN_DIR}/bin/sdkman-init.sh

echo "sdkman_auto_answer=true" > ${SDKMAN_DIR}/etc/config
echo "sdkman_auto_selfupdate=false" >> ${SDKMAN_DIR}/etc/config
echo "sdkman_insecure_ssl=true" >> ${SDKMAN_DIR}/etc/config

sdk version

# do clean
sdk flush || true
rm -rf /var/cache/apt/archives /var/lib/apt/lists
EOF

RUN unset http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY