FROM n8nio/n8n:1.103.2

USER root

# instalar python
RUN apk add --no-cache python3 py3-pip

# instalar libs python
RUN pip3 install \
numpy \
pandas \
requests \
beautifulsoup4 \
lxml \
scikit-learn

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
