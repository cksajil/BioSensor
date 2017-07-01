import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

width  		= 	8
height 		= 	width / 1.618
labelsize   =   13

plt.rc('font', family='serif')
plt.rc('text', usetex=True)
plt.rc('xtick', labelsize = labelsize)
plt.rc('ytick', labelsize = labelsize)
plt.rc('axes', labelsize  = labelsize)


GlucoseLevels 	= 	list(np.arange(3.0, 12.5, 0.5))
Low  			= 	3.0
High  			= 	5.0
Step   			=   0.5

IndexL       	= 	GlucoseLevels.index(Low)
IndexH       	= 	GlucoseLevels.index(High)


data = pd.read_csv('output.csv', index_col=0)
data = data.iloc[:,range(IndexL, IndexH+1, int(Step*2))]
print data

fig1, ax1 = plt.subplots()
fig1.subplots_adjust(left=.12, bottom=.15, right=.95, top=.97)

axes, lines  = data.boxplot(sym='+', return_type='both')

#print lines.keys()
#plt.setp(lines['whiskers'], color='r', lw=2) 

plt.xlabel('Glucose Concentration($mmolL^{-1}$)')
plt.ylabel('Intensity($a. u.$)')
plt.grid(False)
#plt.show()
fig1.set_size_inches(width, height)
fig1.savefig('Results/Trial1_Box_'+str(Low)+'_'+str(High)+'.png')


fig2, ax2 = plt.subplots()
fig2.subplots_adjust(left=.12, bottom=.15, right=.95, top=.97)

meanpoints = np.mean(data.values, axis=0)
Gselected  = np.arange(Low, High+0.5, Step)
print Gselected

plt.scatter(Gselected, meanpoints)
plt.plot(Gselected, meanpoints)
plt.xticks(Gselected)

plt.xlabel('Glucose Concentration($mmolL^{-1}$)')
plt.ylabel('Intensity($a. u.$)')
plt.ylim(190, 225)
plt.grid(True)
#plt.show()

fig2.set_size_inches(width, height)
fig2.savefig('Results/Trial1_MeanRed_'+str(Low)+'_'+str(High)+'.png')




