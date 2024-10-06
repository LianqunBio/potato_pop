### sequencing data filtering
```
java -jar trimmomatic-0.38.jar PE -threads 16 -phred33 NN023-U_1.fq.gz NN023-U_2.fq.gz NN023-U_1.paired.fq.gz NN023-U_1.unpaired.fq.gz NN023-U_2.paired.fq.gz NN023-U_2.unpaired.fq.gz ILLUMINACLIP:adapter.fa:2:35:4:12:true  LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:50
```

### reads mapping and expression calculation
```
hisat2-build dmv6.fa dmv6
hisat2 --dta-cufflinks -x /path/to/dmv6 -1 R1.clean.fq.gz -2 R2.clean.fq.gz --summary-file E.summary --new-summary -p 2 | samtools view -@ 2 -Sb - | samtools sort -@ 2 -o E.bam
stringtie -p 2 -e -G ref.gff3 -o E.out E.bam
```

