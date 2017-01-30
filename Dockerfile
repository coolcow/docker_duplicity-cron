FROM farmcoolcow/duplicity

MAINTAINER Jean-Michel Ruiz <mail@coolcow.org>

ENV ENTRYPOINT_USER=duplicity
ENV ENTRYPOINT_GROUP=duplicity
ENV ENTRYPOINT_HOME=/home
ENV CROND_CRONTAB=/crontab

RUN touch $CROND_CRONTAB

ENTRYPOINT ["/entrypoint_crond.sh"]
CMD ["-f"]
