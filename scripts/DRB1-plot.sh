pgr-pbundle-decomp --help
pgr-pbundle-decomp HLA-DRB1_gene.fa HLA-DRB1_gene -w 80 -r 2 --bundle-length-cutoff 24 --min-branch-size 0 --min-cov 0 --min-span 8
pgr-pbundle-bed2svg HLA-DRB1_gene.bed HLA-DRB1_gene0. --html
pgr-pbundle-bed2dist HLA-DRB1_gene.bed HLA-DRB1_gene.

## add annotation of the exon on the gene plot
## generate the alignment from the exons to the genes
bash ../scripts/immuannot.sh -c HLA-DRB1_gene.fa -r refData-2023Jun05/ -o HLA-DRB1_gene_features -t 20
## covert the hits to a bed file
zless -S HLA-DRB1_gene_features.gtf.gz | awk '$0 !~ /^#/' | sort -k 1  | awk '$3 == "exon"' | awk '{print $1"\t"$4"\t"$5"\t0\t#F00"}' | sort -k1,1 -k2,2n > HLA-DRB1-exons.bed

zless -S HLA-DRB1_gene_features.gtf.gz | awk '$0 !~ /^#/' | sort -k 1  | awk '$3 == "CDS"' | awk '{print $1"\t"$4"\t"$5"\t0\t#F00"}' | sort -k1,1 -k2,2n > HLA-DRB1-CDS.bed

pgr-pbundle-bed2svg HLA-DRB1_gene.bed HLA-DRB1_gene --ddg-file HLA-DRB1_gene.ddg --html --annotation-region-bedfile HLA-DRB1-exons.bed

pgr-pbundle-bed2svg HLA-DRB1_gene.bed HLA-DRB1_gene --ddg-file HLA-DRB1_gene.ddg --html --annotation-region-bedfile HLA-DRB1-CDS.bed

## compare the CDS
pgr-pbundle-decomp HLA-DRB1_CDS.fa HLA-DRB1_CDS0 -w 1 -k 13 -r 1 --bundle-length-cutoff 0 --min-branch-size 0 --min-cov 0 --min-span 0
cat HLA-DRB1_CDS0.bed | grep -v "^#" | awk '{print $1"\t"$2"\t"$3-13"\t"$4}' > HLA-DRB1_CDS.bed
pgr-pbundle-bed2dist HLA-DRB1_CDS.bed HLA-DRB1_CDS.
pgr-pbundle-bed2svg HLA-DRB1_CDS.bed HLA-DRB1_CDS. --html --track-range 1000 --ddg-file HLA-DRB1_CDS.ddg

## Gene level view using the CDS tree
#cat HLA-DRB1_CDS0.bed | grep -v "^#" | awk '{print "HLA-DRB1::"$1"\t"$2"\t"$3"\t"$4}' > HLA-DRB1_CDS2.bed
#pgr-pbundle-bed2dist HLA-DRB1_CDS2.bed HLA-DRB1_CDS2.
cat HLA-DRB1_CDS.ddg | awk '$1 ~ /L/ {print $1"\t"$2"\tHLA-DRB1::"$3}; $1 !~ /L/ {print}' > HLA-DRB1_CDS2.ddg 
pgr-pbundle-bed2svg HLA-DRB1_gene.bed HLA-DRB1_gene_CDS_tree --ddg-file HLA-DRB1_CDS2.ddg --html --annotation-region-bedfile HLA-DRB1-CDS.bed

## use IPD reference
pgr-pbundle-decomp IPD_DRB1.fa IPD_DRB1 -w 80 -r 2 --bundle-length-cutoff 24 --min-branch-size 0 --min-cov 0 --min-span 8
pgr-pbundle-bed2dist IPD_DRB1.bed IPD_DRB1.

pgr-pbundle-bed2svg IPD_DRB1.bed IPD_DRB1 --ddg-file IPD_DRB1.ddg --html 

## use HPRC + IPD

cat IPD_DRB1.fa HLA-DRB1_gene.fa > HLA-DRB1_gene_all.fa

pgr-pbundle-decomp HLA-DRB1_gene_all.fa HLA-DRB1_gene_all  -w 80 -r 2 --bundle-length-cutoff 24 --min-branch-size 0 --min-cov 0 --min-span 8
pgr-pbundle-bed2dist HLA-DRB1_gene_all.bed HLA-DRB1_gene_all.


pgr-pbundle-bed2svg HLA-DRB1_gene_all.bed HLA-DRB1_gene_all. --ddg-file HLA-DRB1_gene_all.ddg --html 

bash ../scripts/immuannot.sh -c HLA-DRB1_gene_all.fa -r refData-2023Jun05/ -o HLA-DRB1_gene_all_features -t 20

zless -S HLA-DRB1_gene_all_features.gtf.gz | awk '$0 !~ /^#/' | sort -k 1  | awk '$3 == "CDS"' | awk '{print $1"\t"$4"\t"$5"\t0\t#000"}' | sort -k1,1 -k2,2n > HLA-DRB1_all-CDS.bed

pgr-pbundle-bed2svg HLA-DRB1_gene_all.bed HLA-DRB1_gene_all --ddg-file HLA-DRB1_gene_all.ddg --html --annotation-region-bedfile HLA-DRB1_all-CDS.bed

## use HPRC + IPD CDS
python get_CDS_seq_from_immuannot.py HLA-DRB1_gene_all.fa  HLA-DRB1_gene_all_features.gtf.gz
#zless HLA-DRB1_CDS.fa refData-2023Jun05/CDSseq/HLA-DRB1.fa.gz > HLA-DRB1_CDS_all.fa
pgr-pbundle-decomp HLA-DRB1_CDS.fa HLA-DRB1_CDS_all0 -w 11 -k 23 -r 1 --bundle-length-cutoff 0 --min-branch-size 0 --min-cov 0 --min-span 0
cat HLA-DRB1_CDS_all0.bed | grep -v "^#" | awk '{print $1"\t"$2"\t"$3-23"\t"$4}' > HLA-DRB1_CDS_all.bed
pgr-pbundle-bed2dist HLA-DRB1_CDS_all.bed HLA-DRB1_CDS_all.
pgr-pbundle-bed2svg HLA-DRB1_CDS_all.bed HLA-DRB1_CDS_all. --html --track-range 1000 --ddg-file HLA-DRB1_CDS_all.ddg

## use HPRC + IPD CDS tree


pgr-pbundle-bed2svg HLA-DRB1_gene_all.bed HLA-DRB1_gene_all --ddg-file HLA-DRB1_CDS_all.ddg --html --annotation-region-bedfile HLA-DRB1_all-CDS.bed


## whole class II with HPRC DRB1 CDS tree
pgr-pbundle-decomp HLA-ClassII_seq.fa.gz HLA-ClassII_seq -w 80 -r 6 --min-branch-size 8 --min-cov 0 --min-span 8 --bundle-length-cutoff 250
zless immuannot_MHC-c2.out.gtf.gz   | grep "HLA-DRB1" | awk '$3 == "gene" {print $1"\t"$4"\t"$5"\t"0"\t#000"}' > immuannot_MHC-c2-DRB1.bed
zless immuannot_MHC-c2.out.gtf.gz   | grep "HLA-DRB1" | awk '$3 == "gene"' | tr ";" "\t" | awk '{print $1"\t"$1":"$12}' | tr -d '"' > immuannot_MHC-c2.annotation
pgr-pbundle-bed2svg HLA-ClassII_seq.bed HLA-ClassII_seq. --html --ddg-file HLA-DRB1_CDS.ddg --annotation-region-bedfile immuannot_MHC-c2-DRB1.bed --annotations immuannot_MHC-c2.annotation --track-panel-width 800

