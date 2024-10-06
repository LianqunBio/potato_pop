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
### individual gvcf calling
```
gatk MarkDuplicates -I out.bam -O out.sorted.markdup.bam -M out.markdup.metrics.txt # mark duplicated reads
rm -rf out.bam
samtools index out.sorted.markdup.bam
gatk HaplotypeCaller -R ~/ref.fa --sample-ploidy 2 --emit-ref-confidence GVCF -I out.sorted.markdup.bam -O out.sample.gvcf # individual sample calling
bgzip -f out.sample.gvcf
tabix -f -p vcf out.sample.gvcf.gz
```
### joint calling
```
gatk GenomicsDBImport -R ~/ref.fa -L Chr$i --sample-name-map gvcf.path --genomicsdb-workspace-path Chr$i.db
gatk GenotypeGVCFs -R ~/ref.fa --sample-ploidy 2 -O Chr$i.combined.vcf -V gendb:/path/to/Chr$i.db -L Chr$i
```
### variation filtering
```
gatk SelectVariants -select-type SNP -V ../03_combine-gvcf/Chr$i.combined.vcf -O Chr$i.snp.vcf.gz
gatk VariantFiltration -V Chr$i.snp.vcf.gz --filter-expression "QD < 2.0" --filter-name "LowQD" --filter-expression "MQ < 40.0" --filter-name "MQ40.0" --filter-expression "FS > 60.0" --filter-name "FS60.0" --filter-expression "SOR > 3.0" --filter-name "SOR3.0" --filter-expression "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" --filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8.0" -O Chr$i.filter.snp.vcf.gz
gatk SelectVariants -select-type INDEL -V ../03_combine-gvcf/Chr$i.combined.vcf -O Chr$i.indel.vcf.gz
gatk VariantFiltration -V Chr$i.indel.vcf.gz --filter-expression "QD < 2.0" --filter-name "LowQD" --filter-expression "MQ < 40.0" --filter-name "MQ40.0" --filter-expression "FS > 200.0" --filter-name "FS200" --filter-expression "SOR > 10.0" --filter-name "SOR10" --filter-expression "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" --filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8.0" -O Chr$i.filter.indel.vcf.gz
```



