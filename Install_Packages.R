## To choose a CRAN Mirror
#chooseCRANmirror(graphics=FALSE)
## Choose 57 for Berkeley, 60 for Iowa, 68 for Revolution R

#install.packages("rneos", repos="http://r-forge.r-project.org/projects/rneos/")

Packages <- c(
  'alr3', 
  'biganalytics', 
  'biglm', 
  'boot',  
  'car', 
  'chron', 
  'cluster', 
  'clusterSim',  
  'clValid', 
  'DAAG', 
  'dtw', 
  'epicalc', 
  'faraway', 
  'fAssets', 
  'fBasics', 
  'fda', 
  'fdakma',
  'fields', 
  'fOptions',
  'foreach', 
  'foreign', 
  'fpc',  
#  'fPortfolio', 
  'fRegression', 
#  'fSeries', 
  'fUtilities', 
  'gam', 
  'gdata', 
  'glmnet', 
  'gmaps', 
  'gmodels', 
  'ggplot2',  
  'gplots', 
  'graphics', 
  'gridExtra', 
  'gsubfn', 
  'gtools', 
  'HiddenMarkov', 
  'HMM', 
  'Hmisc', 
  'hydroTSM', 
  'inline', 
  'iterators', 
  'kernlab', 
  'knitr', 
  'leaps', 
  'limma', 
  'lme4', 
  'lmtest',  
  'longitudinalData', 
  'lpSolve', 
  'lubridate', 
  'maps', 
  'maptools', 
  'mAr', 
  'matrixStats', 
  'mclust', 
  'MEMSS', 
  'mgcv', 
  'modeest', 
  'nlme', 
  'nortest', 
  'numDeriv',   
  'nws',
  'orthogonalsplinebasis',
  'PerformanceAnalytics', 
  'phangorn', 
  'plotrix', 
  'pls', 
  'plyr',  
  'profr',  
  'psych', 
  'quantmod', 
  'quantreg', 
  'R2HTML', 
  'rbenchmark', 
  'Rcpp', 
  'reshape',  
  'reshape2',  
  'RMySQL',   
  'robustbase',   
  'Rsymphony', 
  'sandwich', 
  'SenSrivastava', 
  'sets', 
  'slam',   
  'sos',
  'speff2trial',
  'st', 
  'stats', 
  'survey', 
  'svMisc', 
  'tseries', 
  'TTR', 
  'urca', 
  'vrtest', 
  'wle', 
  'wordcloud', 
  'WriteXLS', 
  'XML', 
  'xtable', 
  'xts', 
  'zipcode', 
  'zoo', 
  'fSeries', 
  'bigmemory', 
  'doSNOW', 
  'snow', 
  'plyr'
)

for(Package in Packages){
  print(Package)
  if(require(package=Package, character.only=T) == F){
    try(install.packages(Package, dependencies = TRUE))
  } else{
    print('already exists')
  }
}

# install.packages('alr3')
# install.packages('biganalytics')
# install.packages('biglm')
# install.packages('boot')
# install.packages('car')
# install.packages('chron')
# install.packages('cluster', dependencies = TRUE)
# install.packages('clusterSim', dependencies = TRUE) ## Wont install on lmcg
# install.packages('clValid')
# install.packages('DAAG')
# install.packages('dtw')
# install.packages('epicalc')
# install.packages('faraway')
# install.packages('fAssets')
# install.packages('fBasics')
# install.packages('fda')
# install.packages('fields')
# install.packages('foreach')
# install.packages('foreign', dependencies = TRUE)
# install.packages('fpc', dependencies = TRUE) # For cluster comparisons ## Wont install on lmcg
# install.packages('fPortfolio', dependencies = TRUE)
# install.packages('fRegression')
# install.packages('fSeries')
# install.packages('fUtilities')
# install.packages('gam')
# install.packages('gdata')
# install.packages('glmnet')
# install.packages('gmaps')
# install.packages('gmodels')
# install.packages('ggplot2') ## Wont install on lmcg
# install.packages('gplots')
# install.packages('graphics')
# install.packages('gridExtra')
# install.packages('gsubfn')
# install.packages('gtools')
# install.packages('HiddenMarkov')
# install.packages('HMM')
# install.packages('Hmisc')
# install.packages('hydroTSM')
# install.packages('inline')
# install.packages('iterators')
# install.packages('kernlab')
# install.packages('knitr')
# install.packages('leaps')
# install.packages('limma')
# install.packages('lme4')
# install.packages('lmtest')
# install.packages('lpSolve')
# install.packages('lubridate')
# install.packages('maps')
# install.packages('maptools')
# install.packages('mAr')
# install.packages('matrixStats')
# install.packages('mclust')
# install.packages('MEMSS')
# install.packages('mgcv')
# install.packages('modeest')
# install.packages('nlme')
# install.packages('nortest')
# install.packages('numDeriv', dependencies=T)  ## To calculate gradient, hessian, jacobian of functions
# install.packages('nws')
# install.packages('PerformanceAnalytics')
# install.packages('phangorn')
# install.packages('plotrix')
# install.packages('pls')
# install.packages('plyr', dependencies=T) ## Wont install on lmcg
# install.packages('profr') ## Wont install on lmcg
# install.packages('psych')
# install.packages('quantmod')
# install.packages('quantreg')
# install.packages('R2HTML')
# install.packages('rbenchmark')
# install.packages('Rcpp')
# install.packages('reshape', dependencies=T) ## Wont install on lmcg
# install.packages('reshape2', dependencies=T) ## Wont install on lmcg
# install.packages('RMySQL')      
# install.packages('robustbase')  
# install.packages('Rsymphony')
# install.packages('sandwich')
# install.packages('SenSrivastava')
# install.packages('sets', dependencies=T) ## Set operations      
# install.packages('slam')        
# install.packages('sos')
# install.packages('st')
# install.packages('stats')
# install.packages('survey')
# install.packages('svMisc')
# install.packages('tseries')
# install.packages('TTR')
# install.packages('urca')
# install.packages('vrtest')
# install.packages('wle')
# install.packages('wordcloud')
# install.packages('WriteXLS')
# install.packages('xlsReadWrite')
# #xls.getshlib()
# install.packages('XML')
# install.packages('xtable')
# install.packages('xts')
# install.packages('zipcode')
# install.packages('zoo')
# 
# install.packages('fSeries')
# 
# install.packages('bigmemory')
# install.packages('doSNOW')
# install.packages('snow')
# install.packages('plyr')
# 
# source('http://www.rmetrics.org/Rmetrics.R')
# install.Rmetrics()


