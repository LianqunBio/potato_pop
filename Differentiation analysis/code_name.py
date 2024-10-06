import os
import sys
import argparse

parser=argparse.ArgumentParser(description='add the code name for divergence region')
parser.add_argument('-i', type =argparse.FileType('r'),help='the divergence regine file')
parser.add_argument('-o', type =argparse.FileType('w'),help='the outputfile')

args=parser.parse_args()

debug=True

num=0
for eachline in args.i:
	eachline=eachline.strip()
	i=eachline.split('\t',1)
	if eachline[0]=='#':
		args.o.write('#Region_ID\t'+i[0][1:]+'\t'+i[1]+'\n')
	else:
		num+=1
		args.o.write('Region_%d\t%s\n' % (num,eachline))
