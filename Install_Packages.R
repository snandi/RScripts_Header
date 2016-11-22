## To choose a CRAN Mirror
#chooseCRANmirror(graphics=FALSE)
## Choose 56 for Berkeley, 60 for Iowa, 68 for Revolution R

#install.packages("rneos", repos="http://r-forge.r-project.org/projects/rneos/")

fn_getPackages <- function(){
  Packages <- c(
    'ade4',                         ## Required by doSNOW            
    'alr3',
    'AppliedPredictiveModeling',    ## Used in Coursera machine learning course
    'animint',                      ## For animated ggplot2 graphics
    'biganalytics', 
    'biglm', 
    'bigmemory', 
    'boot',  
    'car',
    'caret',                        ## For prediction algorithms like boosting, random forest, etc 
    'chron', 
    'cluster', 
    'clusterSim',  
    'clValid', 
    'DAAG',
    'data.table',                   ## More efficient dataframe type operations
    'dbscan',                       ## For density based clustering
    'devtools',                     ## Only works on R3.2.2 or higher, to install packages from github
    'doParallel',
    'doSNOW', 
    'dtw', 
    'e1071',                        ## For naive-bayes classifier
    'ElemStatLearn',                ## Used in Coursera machine learning course
    'epicalc', 
    'faraway', 
    'fAssets', 
    'fBasics', 
    'fda', 
    'fdakma',
    'fdasrvf',
    'fda.usc',                      ## For functional data depth
    'fields', 
    'flexclust',                    ## distance measures and centroid computation for clustering
    'fOptions',
    'foreach',
    'forecast',                     ## for time series modeling  
    'foreign', 
    'fpc',                          ## For cluster comparisons ## Wont install on lmcg
    'gam', 
    'gdata', 
    'glmnet', 
    'gmaps', 
    'gmodels',
    'GGally',                       ## For plotting functions like ggpairs
    'ggfortify',                    ## For plotting lm() and glm() diagnostic plots
    'ggplot2',
<<<<<<< HEAD
    'ggthemes',                     ## For different ggplot2 themes
=======
    'ggthemes',                     ## For different ggplot themes
>>>>>>> 5a71653a263fb6c2d40c159a80f0be308f889a45
    'graphics', 
    'grid',                         ## Needed by animint
    'gridExtra', 
    'gsubfn', 
    'gtools', 
    'hexbin',                       ## Needed by animint
    'HiddenMarkov', 
    'HMM', 
    'Hmisc',
    'hunspell',                     ## text mining, spell checking
    'hydroTSM', 
    'inline', 
    'iterators', 
    'jpeg',	                    ## To read/write jpg images
    'kernlab', 
    'knitr',
    'kSamples',                     ## For k-sample Anderson-Darling test
    'leaps', 
    'limma', 
    'lme4',
    'lmerTest',            
    'lmtest',  
    'longitudinalData', 
    'lpSolve', 
    'lubridate', 
    'maps', 
    'maptools', 
    'mAr', 
    'matrixStats', 
    'mclust',
    'memisc',                       ## For better display of outputs in R markdown
    'MEMSS', 
    'mgcv', 
    'modeest',
    'NCStats',                      ## For chi-square post hoc tests
    'nlme', 
    'nortest', 
    'numDeriv',                     ## To calculate gradient, hessian, jacobian of functions
    'nws',
    'orthogonalsplinebasis',
    'pander',                       ## For better R markdown outputs
    'pdfCluster',   	            ## Cluster pdfs from mixtures, non-parametric
    'PerformanceAnalytics', 
    'pgmm',                         ## Used in Coursera machine learning course
    'phangorn', 
    'plotrix', 
    'pls', 
    'plyr', 
    'PMCMR',                        ## For multiple comparison & post hoc test
    'png',                          ## To read and write png images
    'profr',  
    'proto',                        ## Needed by animint
    'psych', 
    'quantmod', 
    'quantreg',
    'rattle',                       ## To get better plots of regression tree outputs
    'R2HTML', 
    'rbenchmark', 
    'Rcpp',
    'readr',  		                  ## Read flat/tabular text files from disk
    'readstata13',                  ## Read stata 13 objects
    'refund',                       ## Required by Pomann_Staicu_etal 2 sample tests
    'reshape',  
    'reshape2',   
    'Rfit',                         ## Rank based regression models   
    'RMySQL',   
    'robustbase', 
    'robustX',                      ## For multivariate median and other experimental stats
    'rpart',                        ## Used in Coursera machine learning course
    'RJSONIO',                      ## Required by animint
    'Rsymphony', 
    'sandwich', 
    'scales',                       ## Needed by animint
    'SenSrivastava',
    'seqinr',                       
    'servr',                        ## To plot html & js objects produced by animint
    'sets',                         ## Set operations      
    'slam',   
    'snow',
    'SnowballC',                    ## For text mining
    'sos',
    'speff2trial',
    'st',
    'stargazer',                    ## Export tables from different regression outputs into latex
    'stats', 
    'stringr',                      ## For regular expressions
    'survey', 
    'svMisc',
    'tidyr',
    'tm',                           ## Text mining package
    'tseries', 
    'TTR', 
    'urca',
    'UsingR',    
    'vrtest', 
    'wle', 
    'wordcloud', 
#     'WriteXLS',
    'xgboost',                      ## Extreme Gradient Boosting
    'XML', 
    'xtable', 
    'xts', 
    'zipcode', 
    'zoo'
  )
  return(Packages)  
}

fn_ReInstall_Packages_CRAN <- function(Packages = fn_getPackages()){
  ## Choose USA (IA) as the CRAN mirror
  Mirrors <- getCRANmirrors(all = FALSE, local.only = FALSE)
  chooseCRANmirror(graphics = F, ind = which(Mirrors$Name == 'USA (IA)'))

  for(Package in Packages){
    if(require(package=Package, character.only=T) == F){
      try(install.packages(Package, dependencies = TRUE))
    } else{
      print(paste(Package, 'already exists'))
    }
  }
}

#fn_ReInstall_Packages_CRAN(Packages = fn_getPackages())

fn_Install_Packages_CRAN <- function(Packages = fn_getPackages()){
  Mirrors <- getCRANmirrors(all = FALSE, local.only = FALSE)
  chooseCRANmirror(graphics = F, ind = which(Mirrors$Name == 'USA (IA)'))

  for(Package in Packages){
    try(install.packages(Package, dependencies = TRUE))
  }
}
#fn_Install_Packages_CRAN(Packages = fn_getPackages())
