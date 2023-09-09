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
scripts/run_pg_asm.shi                  # the example running Peregrine2021 to assemble the targeted reads
scripts/build_pbd.sh                    # the example to use PGR-TK to process the KIR pangenome
```

Reference:

- Paper: Multiscale analysis of pangenomes enables improved representation of genomic diversity for repetitive and clinically relevant genes: https://www.nature.com/articles/s41592-023-01914-y

- Other examples: https://github.com/GeneDx/pgr-tk-notebooks/

- The PGR-TK code: https://github.com/genedx/pgr-tk and https://github.com/cschin/pgr-tk





