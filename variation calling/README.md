### reads mapping
```
bwa mem -M -R  "@RG\tID:S214\tLB:S214\tPL:ILLUMINA\tSM:S214" ~/ref.fa  R1_clean.fq.gz R2_clean.fq.gz  > out.sam
samtools sort -o out.bam out.sam
rm -rf out.sam
samtools index out.bam
samtools flagstat out.bam > output.infor # extract mapping information
samtools depth out.bam | wc -l >> output.infor # extract covered loci
samtools depth out.bam | awk '{sum+=$3} END {print sum/NR}' >> output.infor # calculate average depth value

```
