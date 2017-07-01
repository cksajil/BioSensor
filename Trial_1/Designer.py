import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

width  		= 	6
height 		= 	width / 1.618
labelsize   =   12

plt.rc('font', family='serif')
plt.rc('text', usetex=True)
plt.rc('xtick', labelsize = labelsize)
plt.rc('ytick', labelsize = labelsize)
plt.rc('axes', labelsize  = labelsize)


GlucoseLevels 	= 	list(np.arange(0.5, 35.5, 0.5))
Low  			= 	3.5
High  			= 	11.5
Step   			=   2
IndexL       	= 	GlucoseLevels.index(Low)
IndexH       	= 	GlucoseLevels.index(High)



data = pd.read_csv('output.csv', index_col=0)
data = data.iloc[:,range(IndexL, IndexH+1, Step)]


fig1, ax = plt.subplots()
fig1.subplots_adjust(left=.12, bottom=.15, right=.99, top=.97)

axes, lines  = data.boxplot(sym='+', return_type='both')

#print lines.keys()
#plt.setp(lines['whiskers'], color='r', lw=2) 


plt.xlabel('Glucose Concentration($mmolL^{-1}$)')
plt.ylabel('Intensity($a. u.$)')
plt.grid(False)
plt.show()

#fig1.set_size_inches(width, height)
#fig1.savefig('Trial1_Box_'+str(Low)+'_'+str(High)+'.pdf')


	



