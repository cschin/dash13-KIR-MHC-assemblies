#pgr-query /wd/pgr-tk-demo-data/data/pgr-tk-HGRP-y1-evaluation-set-v0 KIR_example_seq_for_fetch.fa -r 2 --min-span 0 KIR_HPRC
grep ">" KIR_example_seq_for_fetch.fa | tr -d ">"  > KIR_HPRC.include
less -S KIR_HPRC.000.hit | awk '$4-$3 > 160000 {print $NF}' | sort > KIR_HPRC.include
grep ">" SDS3unalign.fasta  | tr -d ">" >> KIR_HPRC.include
cat KIR_example_seq_for_fetch.fa KIR_HPRC.000.fa SDS3unalign.fasta  > KIR_all.fa
pgr-pbundle-decomp KIR_all.fa -w 128 -r 6 --min-span 4 --bundle-length-cutoff 100 --min-branch-size 4 -i KIR_HPRC.include KIR_pbd
pgr-pbundle-bed2dist KIR_pbd.bed KIR_pbd
pgr-pbundle-bed2offset --alt-anchoring-mode KIR_pbd.bed KIR_pbd
less KIR_pbd.offset | awk '{print $1"\t"$2+50000}' >  KIR_pbd.offset.2
pgr-pbundle-bed2svg  KIR_pbd.bed KIR_pbd --html --ddg-file KIR_pbd.ddg --offsets KIR_pbd.offset.2

find . -name "*_asm_ctg_m.fa" | awk '{print "cp "$0" ."}' | bash
ls *_ctg_m.fa | awk '{print "pgr-query --fastx-file "$0"  KIR_example_seq_for_fetch.fa -r 2 --min-span 0 "$0}' | bash
cat KIR_all.fa > assemble_results.fa
cat *_asm_ctg_m.000.fa >> assemble_results.fa
grep ">" KIR_example_seq_for_fetch.fa | tr -d ">"  > assemble_results.include
less -S KIR_HPRC.000.hit | awk '$4-$3 > 160000 {print $NF}' | sort >> assemble_results.include
grep ">" SDS3unalign.fasta  | tr -d ">" >> assemble_results.include
grep ">" assemble_results.fa | grep ctg | tr -d ">" >> assemble_results.include 

pgr-pbundle-decomp --precomputed-bundles  KIR_pbd.pdb  assemble_results.fa  -w 128 -r 6 --min-span 4 --bundle-length-cutoff 100 --min-branch-size 4 -i assemble_results.include  assemble_results
pgr-pbundle-bed2offset --alt-anchoring-mode assemble_results.bed assemble_results
pgr-pbundle-bed2svg   assemble_results.bed  assemble_results --html --offsets assemble_results.offset --annotation-region-bedfile gene_match_out.bed --track-scaling 2 --annotation-region-stroke-width 10


