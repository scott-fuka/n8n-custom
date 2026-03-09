FROM n8nio/n8n:2.10.4

USER root

RUN ARCH=$(uname -m) && \
    wget -qO- "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/${ARCH}/" | \
    grep -o 'href="apk-tools-static-[^"]*\.apk"' | head -1 | cut -d'"' -f2 | \
    xargs -I {} wget -q "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/${ARCH}/{}" && \
    tar -xzf apk-tools-static-*.apk && \
    ./sbin/apk.static -X http://dl-cdn.alpinelinux.org/alpine/latest-stable/main \
        -U --allow-untrusted add apk-tools && \
    rm -rf sbin apk-tools-static-*.apk

RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-virtualenv \
    build-base \
    libxml2-dev \
    libxslt-dev

RUN pip3 install --no-cache-dir --break-system-packages \
    numpy \
    pandas \
    requests \
    beautifulsoup4 \
    lxml

RUN npm install -g \
    axios \
    node-fetch \
    lodash \
    dayjs \
    uuid \
    cheerio \
    csv-parser \
    xlsx \
    crypto-js \
    jsonwebtoken \
    bcryptjs \
    openai \
    langchain \
    zod \
    p-limit \
    bottleneck

USER node
