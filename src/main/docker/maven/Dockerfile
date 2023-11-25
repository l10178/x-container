ARG BASE_IMG=nxest/openjdk
ARG BASE_IMG_VERSION=21-graal-debian
FROM ${BASE_IMG}:${BASE_IMG_VERSION}

ARG MAVEN_VERSION=3.9.5
ENV MAVEN_HOME=/usr/share/maven

RUN <<EOF
#!/usr/bin/env bash
set -e

apt-get update
apt-get install -y git --no-install-recommends

source $SDKMAN_DIR/bin/sdkman-init.sh
sdk update
sdk install maven ${MAVEN_VERSION}

mv ${SDKMAN_DIR}/candidates/maven/${MAVEN_VERSION} ${MAVEN_HOME}

# do clean
sdk flush || true
rm -rf /var/lib/apt/lists/*
EOF

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY settings.xml ${MAVEN_HOME}/ref/
RUN ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn
# smoke test
RUN mvn --version

ARG USER_HOME_DIR="/root"
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["mvn"]