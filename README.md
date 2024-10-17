# Commands

git clone https://github.com/kunzna/WisconsinUserGroup-HOT.git

cd /home/dtu_training/WisconsinUserGroup-HOT/

vi LogGenerator.yaml

sh ./setuploggen.sh

# Variables

DT_URL:  https://{YOUR_TENANT_ID}.live.dynatrace.com

DT_LOG_INGEST_TOKEN:  {YOUR_DT_LOG_INGEST_TOKEN}

# OpenPipeline App

Pipeline Name: Usergroup - Pipeline

Processor Name: ProcessLogData

Matching Condition: parse content, """'The price of the product' LD:product 'is $' DOUBLE:price"""

Metric Extraction Name: Extract Pricing

Metric Extraction Matching condition: matchesPhrase(content, "The price of the product")

Metric Extraction field: price

Metric Extraction key: open.price

Metric Extraction dimension: product

Data extraction Name: BizEventFromLog

Data extraction Matching condition: matchesPhrase(content, "The price of the product")

Data extraction Event type: log.open.price

Data extraction Event provider: log.open


Dynamic Route Name: ProductPriceRoute

Dynamic Route Matching condition: matchesPhrase(content, "The price of the product")

Dynamic Route Pipeline: Usergroup - Pipeline






