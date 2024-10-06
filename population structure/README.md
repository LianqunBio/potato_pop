### Construct phylogenetic tree utilizing 4d snp loci

```
iTools Fatools  getCdsPep -Ref ref.fa -Gff ref.gff3 -4DSite -OutPut DMv6 # extract potential 4d loci genome wide
python overlap.4d.loci.py # overlap the 4d loci and snp data
python3 filter_genotype.py -i 4d.loci.genotype -o 4d.loci.filtered.genotype
perl genotype2phylip.pl name.code DMv6.4d # change to phylip format
phyml -i DMv6.4d.phylip -d nt -n 1 -b 100 --run_id SYM -m 012345 -f 0.25,0.25,0.25,0.25 -c 1 --no_memory_check -o tlr -s BEST
```
The output newick file by phylip can be uploaded into software MEGA6.0 for further adjusting and coloring.

### Structure analysis utilizing all the snp loci after LD-pruned

```
python3 genotype2ped_map.py -i input.snp.genotype -IND sample.list  -o1 example.ped -o2 example.map
plink --file example --make-bed --out example
plink --file example --indep-pairwise 50 10 0.2 --out ld # LD-pruning using software PLINK
python merge.py # extract the overlapping loci information
python3 genotype2ped_map.py -i ld.filterd.genotype -IND sample.list -o1 ld.miss.filterd.example.ped -o2 ld.miss.filterd.example.map
plink --file ld.miss.filterd.example --make-bed --out ld.miss.filterd.example
admixture -j3 --cv ld.miss.filterd.example.bed 2 | tee log2.out
admixture -j3 --cv ld.miss.filterd.example.bed 3 | tee log3.out 
admixture -j3 --cv ld.miss.filterd.example.bed 4 | tee log4.out
admixture -j3 --cv ld.miss.filterd.example.bed 5 | tee log5.out
admixture -j3 --cv ld.miss.filterd.example.bed 6 | tee log6.out
admixture -j3 --cv ld.miss.filterd.example.bed 7 | tee log7.out
admixture -j3 --cv ld.miss.filterd.example.bed 8 | tee log8.out
admixture -j3 --cv ld.miss.filterd.example.bed 9 | tee log9.out
admixture -j3 --cv ld.miss.filterd.example.bed 10 | tee log10.out
admixture -j3 --cv ld.miss.filterd.example.bed 11 | tee log11.out
admixture -j3 --cv ld.miss.filterd.example.bed 12 | tee log12.out
admixture -j3 --cv ld.miss.filterd.example.bed 13 | tee log13.out
admixture -j3 --cv ld.miss.filterd.example.bed 14 | tee log14.out
admixture -j3 --cv ld.miss.filterd.example.bed 15 | tee log15.out
admixture -j3 --cv ld.miss.filterd.example.bed 16 | tee log16.out
admixture -j3 --cv ld.miss.filterd.example.bed 17 | tee log17.out
admixture -j3 --cv ld.miss.filterd.example.bed 18 | tee log18.out
admixture -j3 --cv ld.miss.filterd.example.bed 19 | tee log19.out
admixture -j3 --cv ld.miss.filterd.example.bed 20 | tee log20.out
```
Output file can be visulized by Excel.

### PCA analysis

```
python3 for_genotype.py -i filtered.genotype -o1 genotype -o2 SNP_info
~/software/EIG-7.2.1/src/eigensrc/smartpca -p parfile # parfile: the configuration file
perl ~/software/EIG-6.0.1/bin/ploteig -i potato.evec -c 1:2 -p CLD1+2:CLD3:CLD4:CND:STN:PHU -x -o potati.xtxt # -p group information (identified according to the result by phylogenetic tree and admixture) # graphing with PC1 and PC2

```
configuaratioin file :
```
genotypename: genotype
snpname: SNP_info
indivname: sample.information
evecoutname: potato.evec
evaloutname: potato.eval
altnormstyle: NO
numoutevec: 10
numoutlieriter: 0
numoutlierevec: 10
outliersigmathresh: 6
qtmode: 0
```


###  LD-decay analysis using all the snp loci 
```
PopLDdecay -InVCF  all.snp.vcf.gz  -OutStat Wild.stat.gz -SubPop Wild.list
PopLDdecay -InVCF  all.snp.vcf.gz  -OutStat landrace.stat.gz -SubPop landrace.list

~/software/PopLDdecay-3.41/bin/Plot_MultiPop.pl -inList  file.list  -output Fig # graph LD-decay figure.  file.list as follows:
~/Wild.stat.gz	Wild
~/landrace.stat.gz landrace
```
### IBD analysis
```
plink --file ld.miss.filterd.example --genome
plink --file ld.miss.filterd.example --cluster --matrix --noweb # for calculate IBS matrix
python3 extract.matrix.py -ibd IBD.plink.genome -name group.list -o group.IBD.matrix.xls
```
