FROM alpine:latest

ENV PORT        4000
ENV KEY         e51a3f0f-917b-43fd-87ca-b53d7f862801
ENV SPATH       /health-check
ENV REDIRECT    https://google.com

ENV USER        4040

COPY ./overlay /

RUN apk add --no-cache tmux ttyd curl nodejs npm rclone aria2 htop nano && \
    npm -g i zx && chmod a+x /etc/init /usr/bin/project && \
    mv /usr/bin/rclone /usr/bin/rustc && \
    mv /usr/bin/aria2c /usr/bin/apt 

EXPOSE ${PORT}

CMD /etc/init

USER root
