### GWAS analysis

```
python3 extract.genotype.py -i all.genotype -all ALL.name.list -part part.name.list -o part.raw.genotype
python3 filter_genotype.py -i part.raw.genotype -o part.filtered.genotype
python3 genotype2ped_map.py -i part.filtered.genotype -IND part.name.list -o1 filterd_all.final.genotype.ped -o2 filterd_all.final.genotype.map
python change_format.py
mv tem filterd_all.final.genotype.map
plink --file filterd_all.final.genotype --recode12 --output-missing-genotype 0 --transpose --out filterd_all.final.genotype --noweb
java -jar -Xms256m -Xmx3300m gec.jar --effect-number --maf 0.05 --linkage-file filterd_all.final.genotype --genome --out filterd_all.final.genotype.effect # calculate threshold value
emmax-kin-intel64 -v -s -d 10 filterd_all.final.genotype
for i in `cat phenotype.list`; do emmax-intel64 -v -d 10 -t filterd_all.final.genotype -p $i -k filterd_all.final.genotype.aIBS.kinf -o $i.EMMAX; done

# graph Manhattan figure and qq-plot
python prepare_input_qqman.py -i output.EMMAX.ps -o input
/home/lianqun/miniconda3/bin/R < qqman.testversion2.R --vanilla
```

### Threshold calculation
```
java -jar -Xms256m -Xmx3300m gec.jar --effect-number --maf 0.05 --linkage-file filterd_all.final.genotype --genome --out filterd_all.final.genotype.effect # filterd_all.final.genotype is the prefix of input file, all the input file can be linked from the dictory of GWAS analysis.
```
