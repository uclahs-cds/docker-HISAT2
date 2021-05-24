FROM blcdsdockerregistry/bl-base:1.0.0 AS builder

RUN conda create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    samtools==1.12 \
    hisat2==2.2.1

FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

LABEL maintainer="Julie Livingstone <jlivingstone@mednet.ucla.edu>"
