Created by : Bhavna Joshi
This is the text file describing the data and the matlab files for the paper " Oil price shocks and sectoral stock markets in an emerging economy" 
The data is stored on the excel file and contains data on the following variables from JAN 2000 to 2018:5
1) Global Oil production obtained from EIA
2) Real economic activity obtained from Lutz Kilian's website
3) Real oil price obtained by adjusting the brent cude oil price for inflation using the CPI in USA
4) Aggregate stock returns for India: S&P BSE SENSEX
5) Sectoral stock returns for Indian economy namely: Health care, Metals, Oil Gas, Auto, Consumer durables. Data for
Industrials Utilities and Finance starts from 2005:9-2018:5

The matlab files are named according to the figure in the paper as Figure.m
The following auxillary files are called at various times in the program and perform the following functions:
Timeseriesall.m uses the data to plot the time series of all the variables used in the paper

TrivarP.m       Loads data and computes LS estimates of VAR
olsvarc.m       Computes least-squares VAR parameters estimates
irfvar.m        Computes VAR impulse responses by Cholesky decomposition
stage2irfown.m  Computes impulse responses from distributed lag model 
dif.m           First-difference operator
vec.m           Vectorization operator
HD.m            Loads data and computes LS estimates of VAR including aggregate stock returns