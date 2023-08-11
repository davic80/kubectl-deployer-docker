FROM alpine:3.18

LABEL MAINTAINER="David Cornejo <david.cornejo@gmail.com>"

#https://kubernetes.io/releases/
ENV KUBECTL_VERSION="v1.24.16"

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl \
    && apk add --update gettext \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge deps \
    && rm /var/cache/apk/*
