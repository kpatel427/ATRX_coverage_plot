#!/usr/bin/Python

'''
samples = []



with open("/Users/patelk26/Desktop/ATRX_coverage/ATRX_exon_coverage.txt",'r') as f1:
	for line in f1:
		a = line.split()
		samples.append(a[0])

		if(a[0] in samples):
			# compute the coverage/fpkm for every transcript


		else:
			#append the new id to the list of samples

'''

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

lst_samples = []
lst_transcripts = []

df = pd.read_table('/Users/patelk26/Desktop/ATRX_coverage/ATRX_exon_coverage.txt', delim_whitespace=True)
#print(df)


#Adding a column with the result of cov/fpkm
df['cov/fpkm'] = df.apply(lambda row: row.read_count / row.FPKM, axis=1)
#df

'''
lst_samples = df['Sample'].tolist()
lst_transcripts = df['transcript'].tolist()

#%matplotlib qt
ax = sns.swarmplot( x="transcript", y="cov/fpkm", data=df)
ax.set_xticklabels(ax.get_xticklabels(), rotation=90, fontsize = 5)
plt.tight_layout()
plt.show()
#sns.set(rc={"figure.figsize": (25, 10)})
'''

trans = []

trans = df['transcript'].tolist()

print(set(trans))