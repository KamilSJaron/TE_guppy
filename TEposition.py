import numpy
import matplotlib.pyplot as plt

sex_chromosome = open("./sex_chr.fasta.masked").read().replace('\n','')

window = 10000
repeat = []
Ns = []

for start in range(len(sex_chromosome)-window):
	win = sex_chromosome[start:start+window]
	masked = 0
	N = 0
	for c in range(window):
		if win[c] != "N":
			if win[c].isupper():
				masked=masked
			elif win[c].islower():
				masked+=1
		else:
			N+=1
	repeat.append(masked/window)
	Ns.append(N/window)


plt.figure(figsize=(20,10))
plt.plot(repeat, label = "Repeat",linewidth=3)
plt.plot(Ns, label = "Ns",linewidth=3)
plt.ylabel('Fraction of Repeat')
plt.xlabel('Position of Genome')
plt.title("Repetitive sequence position in male guppy's sex chromosome")
plt.legend()
plt.savefig("./TEposition10k.png")
plt.show


