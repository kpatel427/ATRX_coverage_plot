#!/usr/bin/Python
# only keep the NBL samples present in file 2018-08-23-pdx-clinical-final-for-paper.txt

lst_nbl = []

'''
#output file with nbl samples
nbl_samples = open("/Users/patelk26/Desktop/ATRX_coverage/ATRX_exon_coverage_nblsamples.txt",'a');

#opening the original file and getting a list of all models with 'neuroblastoma histology'
with open("/Users/patelk26/Desktop/ATRX_coverage/NBL_sample_list.txt",'r') as fh1:
	for line in fh1:
		line.rstrip()
		a = line.split()
		lst_nbl.append(a[0])	# Appending Model to a list, removing the last "\n" character


#print(lst_nbl)


# To write out header only once
with open("/Users/patelk26/Desktop/ATRX_coverage/ATRX_exon_coverage.txt",'r') as fh2:
	header = fh2.readline()	
	nbl_samples.write(header)	# Adding header line to the new file

# for every model in the list, match it with the sample ID in this file, to keep only those ones that match	
for x in lst_nbl:
	with open("/Users/patelk26/Desktop/ATRX_coverage/ATRX_exon_coverage.txt",'r') as fh2:
		#header = fh2.readline()	
		#nbl_samples.write(header)	# Adding header line to the new file
		lines = fh2.readlines()[1:]
		for line2 in lines:
			a = line2.split()
			if(a[0] in x):
				#print(x,line2) # Sanity check!
				nbl_samples.write(x+"\t"+line2)	# writing NBL samples to a new file

print("Done!")
'''
out = open("/Users/patelk26/Desktop/ATRX_coverage/FPKM_exon.csv",'a');


with open("/Users/patelk26/Desktop/ATRX_coverage/FPKM_transcripts_per_exon_1.csv",'r+') as fh2:
	header = fh2.readline()	
	out.write(header)
	lines = fh2.readlines()[1:]
	for line2 in lines:
		with open("/Users/patelk26/Desktop/ATRX_coverage/NBL_sample_list.txt",'r') as fh1:
			lines = fh1.readlines()[1:]
			for line in lines:
				line.rstrip()
				line2.rstrip()
				a1 = line.split()
				a2 = line2.split(',')
				if(a1[0] == a2[0]):
					line2 = line2.replace(a2[0],a1[1])
					out.write(line2)
					
print("Done!")

