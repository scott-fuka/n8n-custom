FROM n8nio/n8n:2.10.4

USER root

# instalar python, pip e dependências básicas
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# instalar libs python
RUN pip3 install --no-cache-dir --break-system-packages \
    numpy \
    pandas \
    requests \
    beautifulsoup4 \
    lxml

# instalar libs node globais
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
