pgr-pbundle-decomp --help
pgr-pbundle-decomp HLA-DRB1_gene.fa HLA-DRB1_gene -w 80 -r 2 --bundle-length-cutoff 24 --min-branch-size 0 --min-cov 0 --min-span 8
pgr-pbundle-bed2svg HLA-DRB1_gene.bed HLA-DRB1_gene0. --html
pgr-pbundle-bed2dist HLA-DRB1_gene.bed HLA-DRB1_gene.

## add annotation of the exon on the gene plot
## generate the alignment from the exons to the genes
bash ../scripts/immuannot.sh -c HLA-DRB1_gene.fa -r refData-2023Jun05/ -o HLA-DRB1_gene_features -t 20
## covert the hits to a bed file
zless -S HLA-DRB1_gene_features.gtf.gz | awk '$0 !~ /^#/' | sort -k 1  | awk '$3 == "exon"' | awk '{print $1"\t"$4"\t"$5"\t0\t#F00"}' | sort -k1,1 -k2,2n > HLA-DRB1-exons.bed

pgr-pbundle-bed2svg HLA-DRB1_gene.bed HLA-DRB1_gene --ddg-file HLA-DRB1_gene.ddg --html --annotation-region-bedfile HLA-DRB1-exons.bed
