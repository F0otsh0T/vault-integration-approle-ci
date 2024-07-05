FROM nginx:mainline-alpine3.19
COPY index.html /usr/share/nginx/html/index.html
COPY . /app
WORKDIR /app
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


## Credit: https://www.hashicorp.com/blog/installing-hashicorp-tools-in-alpine-linux-containers
ARG PRODUCT
ARG VERSION
ARG VAULT_ADDR
ARG VAULT_NAMESPACE
ARG VAULT_AUTH_APPROLE_PATH
ARG VAULT_AUTH_APPROLE_ROLE
ARG VAULT_AUTH_APPROLE_ROLEID
ARG WRAPPED_TOKEN
ARG BUILD_DATE
ARG VCS_REF
ARG VAULT_READ_ROLEID

ENV PRODUCT=${PRODUCT}
ENV VERSION=${VERSION}
ENV VAULT_ADDR=${VAULT_ADDR}
ENV VAULT_NAMESPACE=${VAULT_NAMESPACE}
ENV VAULT_AUTH_APPROLE_PATH=${VAULT_AUTH_APPROLE_PATH}
ENV VAULT_AUTH_APPROLE_ROLE=${VAULT_AUTH_APPROLE_ROLE}
ENV VAULT_AUTH_APPROLE_ROLEID=${VAULT_AUTH_APPROLE_ROLEID}
ENV WRAPPED_TOKEN=${WRAPPED_TOKEN}
ENV BUILD_DATE=${BUILD_DATE}
ENV VCS_REF=${VCS_REF}
ENV VAULT_READ_ROLEID=${VAULT_READ_ROLEID}

## [DEBUG] `build-args`
RUN env && \
    pwd && \
    ls -al /app

RUN chmod +x /app/app.sh

RUN apk add --update --virtual .deps --no-cache gnupg && \
    cd /tmp && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_linux_amd64.zip && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify ${PRODUCT}_${VERSION}_SHA256SUMS.sig ${PRODUCT}_${VERSION}_SHA256SUMS && \
    grep ${PRODUCT}_${VERSION}_linux_amd64.zip ${PRODUCT}_${VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/${PRODUCT}_${VERSION}_linux_amd64.zip -d /tmp && \
    mv /tmp/${PRODUCT} /usr/local/bin/${PRODUCT} && \
    rm -f /tmp/${PRODUCT}_${VERSION}_linux_amd64.zip ${PRODUCT}_${VERSION}_SHA256SUMS ${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS.sig && \
    apk add jq bash && \
    apk del .deps

# ENTRYPOINT [ "/app/app.sh" ]
ENTRYPOINT [ "sh" ]
CMD [ "/app/app.sh" ]
# CMD [ "app.sh" ]
