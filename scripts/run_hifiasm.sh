## requirements:
## input file s3://dash13-kir-mhc-assemblies/SDS3unalign.fasta
## installing hifiasm, gfatools and peregrine2021

# using hifiasm to assemble reads in each directory, we need to subsample the reads or it takes a long time to assemble
pushd $1
s=$(ls *.fastq.gz)
prefix="${s%.fastq.gz}"
echo $prefix
pgr-filter SDS3unalign.fasta -q ${prefix}.fastq.gz | head -2000 > downsamped.fa
#zcat ${prefix}.fastq.gz | head -4000 > downsamped.fa
rm ${prefix}.asm.*
rm ${prefix}_2000.asm.*
hifiasm -t 40 -N 10000 downsamped.fa --primary -o ${prefix}_2000.asm
gfatools gfa2fa ${prefix}_2000.asm.p_ctg.gfa > ${prefix}_2000.asm.pa_ctg.fa
gfatools gfa2fa ${prefix}_2000.asm.a_ctg.gfa >> ${prefix}_2000.asm.pa_ctg.fa
fastalength ${prefix}_2000.asm.pa_ctg.fa

pgr-filter /wd/KIR_reads/SDS3unalign.fasta -q ${prefix}.fastq.gz | head -5000 > downsamped.fa
#zcat ${prefix}.fastq.gz | head -4000 > downsamped.fa
rm ${prefix}_5000.asm.*
hifiasm -t 40 -N 10000 downsamped.fa --primary -o ${prefix}_5000.asm
gfatools gfa2fa ${prefix}_5000.asm.p_ctg.gfa > ${prefix}_5000.asm.pa_ctg.fa
gfatools gfa2fa ${prefix}_5000.asm.a_ctg.gfa >> ${prefix}_5000.asm.pa_ctg.fa
# fastalength ${prefix}_5000.asm.pa_ctg.fa
popd
