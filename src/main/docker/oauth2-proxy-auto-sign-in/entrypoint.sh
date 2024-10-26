#!/bin/sh
set -e

if [ -z "$OAUTH2_PROXY_CUSTOM_TEMPLATES_DIR" ] && [ -z "$NXEST_CUSTOM_TEMPLATES_DIR" ]; then
  echo "Error: Env OAUTH2_PROXY_CUSTOM_TEMPLATES_DIR or NXEST_CUSTOM_TEMPLATES_DIR is not set."
  exit 1
fi

dest=${OAUTH2_PROXY_CUSTOM_TEMPLATES_DIR:-$NXEST_CUSTOM_TEMPLATES_DIR}

cp -f /templates/sign_in.html ${dest}/sign_in.html

head -n 15 ${dest}/sign_in.html

echo "copied ${dest}/sign_in.html"
