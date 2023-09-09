## requirements:
## input file s3://dash13-kir-mhc-assemblies/SDS3unalign.fasta
## installing hifiasm, gfatools and peregrine2021

# using hifiasm to assemble reads in each directory, we need to subsample the reads or it takes a long time to assemble

pushd $1
s=$(ls *.fastq.gz)
prefix="${s%.fastq.gz}"
echo $s > input
pg_asm input asm 24 24
mv asm/asm_ctgs_m.fa ${prefix}_asm_ctg_m.fa
echo $prefix
fastalength ${prefix}_asm_ctg_m.fa
popd
