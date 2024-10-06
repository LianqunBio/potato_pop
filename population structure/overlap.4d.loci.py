f1=open('367.out.genotype','r')
f2=open('all.4d.loci','r')
p=open('4d.loci.genotype','w')
dict1={}
for eachline in f2:
	eachline=eachline.strip()
	i=eachline.split()
	ID=i[0]+'\t'+i[1]
	dict1[ID]=0

for eachline in f1:
	eachline=eachline.strip()
	i=eachline.split()
	ID=i[0]+'\t'+i[1]
	if ID in dict1:
		p.write(eachline+'\n')
