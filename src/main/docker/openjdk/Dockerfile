ARG BASE_IMG=nxest/base-debian
ARG BASE_IMG_VERSION=stable-slim
FROM ${BASE_IMG}:${BASE_IMG_VERSION}
# WORKDIR /opt
ARG GRAALVM_VERSION=21.0.1-graalce
RUN <<EOF
#!/usr/bin/env bash
set -e

source $SDKMAN_DIR/bin/sdkman-init.sh
sdk update
sdk install java ${GRAALVM_VERSION}
sdk flush || true
EOF

ENV JAVA_HOME=${SDKMAN_DIR}/candidates/java/${GRAALVM_VERSION}
ENV PATH=$JAVA_HOME/bin:$PATH

ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["java"]