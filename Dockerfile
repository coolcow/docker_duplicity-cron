FROM farmcoolcow/duplicity

MAINTAINER Jean-Michel Ruiz (coolcow) <mail@coolcow.org>

# Build-time metadata as defined at http://label-schema.org

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="alpine_entrypoint" \
      org.label-schema.description="Docker base image with su-exec and crond entrypoint scripts, based on alpine." \
      org.label-schema.url="https://hub.docker.com/r/farmcoolcow/alpine_entrypoint/" \
      org.label-schema.license="GPL-3.0" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/farmcoolcow/docker_alpine_entrypoint" \
      org.label-schema.vendor="coolcow.org" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"


ENV ENTRYPOINT_USER=duplicity \
    ENTRYPOINT_GROUP=duplicity \
    ENTRYPOINT_HOME=/home \
    CROND_CRONTAB=/crontab

RUN touch $CROND_CRONTAB

ENTRYPOINT ["/entrypoint_crond.sh"]

CMD ["-f"]
