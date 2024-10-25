FROM busybox:1.37
ARG OAUTH2_PROXY_TAG=v7.7.1

WORKDIR /templates

COPY entrypoint.sh /entrypoint.sh

ADD https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/refs/tags/${OAUTH2_PROXY_TAG}/pkg/app/pagewriter/sign_in.html /templates/sign_in.html

RUN <<EOF
#!/bin/sh
set -e
#  add auto redirect script after <title>
sed -i '/<title>/a \
    <script> \
        window.location = "{{.ProxyPrefix}}/start?rd=" + encodeURI(window.location) \
    </script>' /templates/sign_in.html

head -n 15 /templates/sign_in.html
chmod 644 /templates/sign_in.html
chmod a+x /entrypoint.sh

EOF

ENTRYPOINT [ "/entrypoint.sh" ]