bash ../scripts/immuannot.sh -c HLA-ClassII_seq.fa.gz  -r refData-2023Jun05/ -o immuannot_MHC-c2.out -t 20
#zcat KIR_HPRC.000.fa assemble_results.fa.gz > KIR_all.fa
bash ../scripts/immuannot.sh -c KIR_all.fa.gz  -r refData-2023Jun05/ -o immuannot_KIR-all.out -t 20

python get_gene_seq_from_immuannot.py HLA-ClassII_seq.fa.gz immuannot_MHC-c2.out.gtf.gz
python get_gene_seq_from_immuannot.py KIR_all.fa.gz immuannot_KIR-all.out.gtf.gz
tar czvf HLA-C2-KIR_gene_sequences_from_immuannot.tgz *_gene.fa
