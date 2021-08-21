FROM alpine:3.10

RUN apk --update --no-cache add curl jq openssl python3 && \
    pip3 install awscli --upgrade

RUN VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl
