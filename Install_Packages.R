## To choose a CRAN Mirror
#chooseCRANmirror(graphics=FALSE)
## Choose 57 for Berkeley, 60 for Iowa, 68 for Revolution R

#install.packages("rneos", repos="http://r-forge.r-project.org/projects/rneos/")

Packages <- c(
              'alr3', 
              'animint',            ## For animated ggplot2 graphics
              'biganalytics', 
              'biglm', 
              'bigmemory', 
              'boot',  
              'car', 
              'chron', 
              'cluster', 
              'clusterSim',  
              'clValid', 
              'DAAG',
              'devtools', 
              'doSNOW', 
              'dtw', 
              'epicalc', 
              'faraway', 
              'fAssets', 
              'fBasics', 
              'fda', 
              'fdakma',
              'fdasrvf',
              'fields', 
              'fOptions',
              'foreach',
              'forecast',            ## for time series modeling  
              'foreign', 
              'fpc',                 ## For cluster comparisons ## Wont install on lmcg
              #'fPortfolio', 
              'fRegression', 
              #'fSeries', 
              'fUtilities', 
              'gam', 
              'gdata', 
              'glmnet', 
              'gmaps', 
              'gmodels', 
              'ggplot2',  
              #  'gplots',           ## deprecated
              'graphics', 
              'grid',                ## Needed by animint
              'gridExtra', 
              'gsubfn', 
              'gtools', 
              'hexbin',             ## Needed by animint
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
              'numDeriv',            ## To calculate gradient, hessian, jacobian of functions
              'nws',
              'orthogonalsplinebasis',
              'PerformanceAnalytics', 
              'phangorn', 
              'plotrix', 
              'pls', 
              'plyr',  
              'profr',  
              'proto',               ## Needed by animint
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
              'robustX',             ## For multivariate median and other experimental stats
              'RJSONIO',             ## Required by animint
              'Rsymphony', 
              'sandwich', 
              'scales',              ## Needed by animint
              'SenSrivastava', 
              'sets',                ## Set operations      
              'slam',   
              'snow', 
              'sos',
              'speff2trial',
              'st', 
              'stats', 
              'survey', 
              'svMisc', 
              'tseries', 
              'TTR', 
              'urca',
              'UsingR',    
              'vrtest', 
              'wle', 
              'wordcloud', 
              'WriteXLS', 
              'XML', 
              'xtable', 
              'xts', 
              'zipcode', 
              'zoo'
)

for(Package in Packages){
  if(require(package=Package, character.only=T) == F){
    try(install.packages(Package, dependencies = TRUE))
  } else{
    print(paste(Package, 'already exists'))
  }
}

