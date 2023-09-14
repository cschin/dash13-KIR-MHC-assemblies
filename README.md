# dash13-KIR-MHC-assemblies

data source: 48.fastq.tar.gz shared by Marting from Dropbox

prefected data from HPRC:

```
data/HLA-ClassII_seq.fa.gz              # The HPRC HLA ClassII sequence file used in the paper
data/KIR_HPRC.000.fa                    # the HPRC KIR sequence file
data/KIR_example_seq_for_fetch.fa       # the sequence used for fetching for the KIR region
```

KIR resuls:

```
results/KIR/assemble_results.bed        # the principal bundle decomposition 
results/KIR/assemble_results.fa.gz      # the assembled sequence from the targeted sequence reads, 48.fastq.tar.gz
results/KIR/assemble_results.html       # the visualization of the principal bundle decomposition of the KIR region
```

Scripts:

```
scripts/run_hifiasm.sh                  # the example to sub-sampling and run hifiasm for assembling the targeted reads
scripts/run_pg_asm.sh                   # the example running Peregrine2021 to assemble the targeted reads
scripts/build_pbd.sh                    # the example to use PGR-TK to process the KIR pangenome
```


Proposed projects:

1. Using miniprop to align protein sequences on the pan-KIR sequences
2. Using LLM / ML techniques to classify the pan-KIR sequences
4. Imputation missing sequenceand genotype additional read eata with known haplotype sequence combinations


Reference:

- Paper: Multiscale analysis of pangenomes enables improved representation of genomic diversity for repetitive and clinically relevant genes: https://www.nature.com/articles/s41592-023-01914-y

- Other examples: https://github.com/GeneDx/pgr-tk-notebooks/

- The PGR-TK code: https://github.com/genedx/pgr-tk and https://github.com/cschin/pgr-tk

- protein sequences ftp://ftp.dfci.harvard.edu/pub/hli/tmp/pangene-primate-20230811.tar

- minprop: https://github.com/lh3/miniprot.git

- Immuannot: https://github.com/YingZhou001/Immuannot.git

- py-gfe: https://github.com/nmdp-bioinformatics/py-gfe

- GFE service: https://github.com/nmdp-bioinformatics/gfe-service

- https://hub.docker.com/r/nmdpbioinformatics/imgt_biosqldb/

- https://hub.docker.com/r/nmdpbioinformatics/gfe-db/






