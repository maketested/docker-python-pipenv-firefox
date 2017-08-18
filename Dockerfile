FROM python:3.6.1-alpine

RUN apk --update add ca-certificates wget && \
    update-ca-certificates

# Tooling

RUN apk --update add make

# pipenv

RUN pip install pipenv~=5.1.1

# Firefox

RUN apk --update --no-cache add firefox-esr && \
    rm -rf /tmp/* /var/cache/apk/*

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux64.tar.gz && \
    tar -xvzf geckodriver-v0.17.0-linux64.tar.gz && \
    chmod +x geckodriver && \
    cp geckodriver /usr/local/bin/
