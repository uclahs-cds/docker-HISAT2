ARG MINIFORGE_VERSION=23.1.0-3

FROM condaforge/mambaforge:${MINIFORGE_VERSION} AS builder

# add channels in correct order to avoid missing libcrypto dependency
# https://github.com/bioconda/bioconda-recipes/issues/12100
ARG HISAT2_VERSION=2.2.1
ARG SAMTOOLS_VERSION=1.17

RUN mamba create -qy -p /usr/local \
    -c defaults \
    -c bioconda \
    -c conda-forge \
    hisat2==${HISAT2_VERSION} \
    samtools==${SAMTOOLS_VERSION}

FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL maintainer="Beth Neilsen <BNeilsen@mednet.ucla.edu>" \ 
org.opencontainers.image.source=https://github.com/uclahs-cds/docker-HISAT2
