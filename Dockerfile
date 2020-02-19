FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y curl unzip groff jq

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

RUN aws --version

COPY invalidate .
RUN chmod +x invalidate

ENTRYPOINT ["/bin/bash", "./invalidate"]
