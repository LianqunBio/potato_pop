import os
import sys
import argparse

parser=argparse.ArgumentParser(description='find the gene of the regine sweep base on the annotation file')
parser.add_argument('-i1', type =argparse.FileType('r'),help='the sweep regine file')
parser.add_argument('-i2', type =argparse.FileType('r'),help='the annotation file')
parser.add_argument('-i3', type =argparse.FileType('r'),help='the function infor')
parser.add_argument('-o', type =argparse.FileType('w'),help='the outputfile')

args=parser.parse_args()

debug=True


zd_pos={}
zd_infor={}
zd_length={}

for eachline in args.i3:
	eachline=eachline.strip()
	i=eachline.split('\t',1)
	zd_infor[i[0]]=i[1]

for eachline in args.i2:
	eachline = eachline.strip()
	i=eachline.split('\t')
	if eachline[0]=='#':
		continue
	else:
		if i[2]!='mRNA':
			continue
		else:
			gene_ID=i[8].split(';')[0].split('=')[1]
#			print(gene_ID)
			for index in range(int(i[3]),int(i[4])+1):
				ID=i[0]+'_'+str(index)
				zd_pos[ID]=gene_ID

for eachline in args.i1:
	eachline=eachline.strip()
	i=eachline.split()
	if eachline[0]=='#':
		continue
	else:
		lst=[]
		sweep_ID=i[0]
		chr_ID=i[1]
		for num in range(int(i[2]),int(i[3])+1):
			ID=chr_ID+'_'+str(num)
			if ID in zd_pos:
				if zd_pos[ID] not in lst:
#					print(zd_pos[ID])
					lst.append(zd_pos[ID])
					if zd_pos[ID] in zd_infor:
						args.o.write('%s\t%s\t%s\n' % (zd_pos[ID],sweep_ID,zd_infor[zd_pos[ID]]))
					else:
						args.o.write('%s\t%s\tNONE\n' % (zd_pos[ID],sweep_ID))
				else:
					continue
			else:
				continue	
