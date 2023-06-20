# docker-HISAT2
Dockerfile for HISAT2, which "is a fast and sensitive alignment program for mapping next-generation sequencing reads (whole-genome, transcriptome, and exome sequencing data) against the general human population (as well as against a single reference genome)."

SAMtools is also installed for use in the align-RNA and align-DNA pipelines.
This is because many aligners (e.g. BWA-MEM2 and HISAT2) only support outputting the uncompressed SAM, which causes a burden on the hard disk IO and limits the performace.

The HISAT2 image with SAMtools is located in the Boutros Lab Docker Hub repo: https://github.com/uclahs-cds/docker-HISAT2

# Documentation
HISAT2 manual is [here](http://daehwankimlab.github.io/hisat2/manual/)

# Version
| Tool | Version |
|------|---------|
| HISAT2 | 2.2.1 |
| SAMTools| 1.17 |

---

## References

1. https://www.nature.com/articles/s41587-019-0201-4
2. http://daehwankimlab.github.io/hisat2/
