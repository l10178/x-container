FROM debian:stable-slim
WORKDIR /opt
ENV SDKMAN_DIR=/opt/sdkman
RUN <<EOF
#!/usr/bin/env bash
set -e
apt-get update
apt-get install -y --no-install-recommends ca-certificates curl zip unzip tini libjemalloc2
curl 'https://get.sdkman.io' | bash
source $SDKMAN_DIR/bin/sdkman-init.sh

echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config
echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config
echo "sdkman_insecure_ssl=true" >> $SDKMAN_DIR/etc/config

sdk version

# do clean
sdk flush || true
rm -rf /var/cache/apt/archives /var/lib/apt/lists
EOF
