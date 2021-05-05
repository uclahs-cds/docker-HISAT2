FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# install hisat2
RUN wget https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download && \
    echo "e2b43f6f55c8d8e5a46648cf86ad4af004671ec859fcca0c52edc392bdf6f03094f4de41b1a051a6866cf4e48c9e61e9f26cd145957eeacf999ce0c0815f2120  download" | sha512sum --status -c - && \
    unzip download && \
    rm download && \
    cd hisat2-2.2.1 && \
    cp -t /usr/local/bin hisat2 hisat2-align-s hisat2-align-l hisat2-build hisat2-build-s hisat2-build-l hisat2-inspect hisat2-inspect-s hisat2-inspect-l

LABEL maintainer="Julie Livingstone <jlivingstone@mednet.ucla.edu>"
