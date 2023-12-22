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
echo "success"
EOF

RUN unset http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY