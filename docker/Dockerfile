# syntax=docker/dockerfile:1
FROM node:20-bullseye-slim

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chrome that Puppeteer
# installs, work.
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg \
    && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable libxss1 \
        fonts-open-sans fonts-roboto fonts-freefont-ttf \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY . /
ENTRYPOINT ["/entrypoint.sh"]

ENV LIKEC4_NO_SANDBOX="true"

ARG PUPPETEER_VER=20.7.3 \
    LIKEC4_VER=latest

RUN cd /puppeteer-runner \
    && npm add puppeteer@$PUPPETEER_VER \
    && npm install -g @likec4/cli@$LIKEC4_VER
