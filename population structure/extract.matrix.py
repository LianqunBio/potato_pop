import os
import sys
import argparse
import re

parser=argparse.ArgumentParser(description='extract the matrix from IBD result')
parser.add_argument('-ibd', type =argparse.FileType('r'),help='the IBD result')
parser.add_argument('-name', type =argparse.FileType('r'),help='the given sample list')
parser.add_argument('-o', type =argparse.FileType('w'),help='the name of output file')

args=parser.parse_args()

debug=True

dict1={}
for eachline in args.name:
	eachline=eachline.strip()
	dict1[eachline]=0

dict2={}
lstorder=[]
for eachline in args.ibd:
	eachline=eachline.strip()
	i=eachline.split()
	if i[0]=='FID1':
#		print(i[9])
		continue
	else:
		if i[0] in dict1 and i[2] in dict1:
			if i[0] not in lstorder:
				lstorder.append(i[0])	
				dict2[i[0]]=i[9]+'\t'
			else:
				dict2[i[0]]+=i[9]+'\t'

for it in lstorder:
	args.o.write(it+'\t'+dict2[it].strip()+'\n')






