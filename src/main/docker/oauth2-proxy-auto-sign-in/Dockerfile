FROM busybox:1.37
WORKDIR /templates

COPY entrypoint.sh /entrypoint.sh
COPY sign_in.html /templates/sign_in.html
RUN chmod a+x /entrypoint.sh && chmod 644 /templates/sign_in.html

ENTRYPOINT [ "/entrypoint.sh" ]