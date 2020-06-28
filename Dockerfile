FROM alpine:3.5

RUN mkdir -p ~/.ssh && \
    echo "Host *" > ~/.ssh/config && \
    echo "    LogLevel ERROR" >> ~/.ssh/config && \
    echo "    StrictHostKeyChecking no" >> ~/.ssh/config && \
    echo "    UserKnownHostsFile /dev/null" >> ~/.ssh/config && \
    chmod 700 ~/.ssh && chmod 600 ~/.ssh/config && \
    apk add --no-cache openssh-client ca-certificates
