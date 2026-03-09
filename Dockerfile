FROM alpine:3.23 AS alpine

FROM n8nio/n8n:2.10.4

USER root

# Recoloca o apk na imagem hardened do n8n
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /lib/ld-musl-*.so.1 /lib/
COPY --from=alpine /lib/libapk.so* /lib/
COPY --from=alpine /usr/lib/libcrypto.so* /usr/lib/
COPY --from=alpine /usr/lib/libssl.so* /usr/lib/
COPY --from=alpine /usr/lib/libz.so* /usr/lib/

# Atualiza índice e instala Python/pip e utilitários de compilação
RUN apk update && apk add --no-cache \
    python3 \
    py3-pip \
    py3-virtualenv \
    build-base \
    libxml2-dev \
    libxslt-dev

# Instala libs Python
RUN pip3 install --no-cache-dir --break-system-packages \
    numpy \
    pandas \
    requests \
    beautifulsoup4 \
    lxml

# Instala libs Node globais
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
