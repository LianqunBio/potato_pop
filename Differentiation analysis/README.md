### Fst calculation
```
vcftools --gzvcf all.vcf.gz --weir-fst-pop stn.individual.list --weir-fst-pop phu.individual.list --out phu_stn.site.fst # calculate the fst value for single site
vcftools --gzvcf all.vcf.gz --weir-fst-pop stn.individual.list --weir-fst-pop phu.individual.list --out phu_stn.win.fst --fst-window-size 100000 --fst-window-step 10000 # calculate the fst value for window size with step
```
### Identify differentional regions
```
grep -v - phu_stn.win.fst.windowed.weir.fst > all_no_minus.Fst
cat all_no_minus.Fst | grep -v e > all_NO_e.Fst
sort -k 5,5nr all_NO_e.Fst > all_sorted_NO_e.Fst
head -n 3645 all_sorted_NO_e.Fst | cut -f 1,2,5 > top5_all_sorted_NO_e.Fst
sort -k 1.4n -k 2,2n top5_all_sorted_NO_e.Fst > sorted_top5_all_sorted_NO_e.Fst
python3 count_top_percent_5_divergence_region.py -i sorted_top5_all_sorted_NO_e.Fst -o divergence_regine
python code_name.py -i divergence_regine -o new_divergence_regine.xls
python3find_gene_in_sweep_regine.py -i1 new_divergence_regine.xls -i2 ref.gff3 -i3 gene.annotation.infor.xls -o gene_IN_divergence_regine
R<new.get_Fst_value_lines_graph.R --vanilla
```
