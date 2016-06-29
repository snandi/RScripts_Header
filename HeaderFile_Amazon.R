fn_getPackages_Amazon <- function(){
  Packages <- c(
    'ade4',                         ## Required by doSNOW            
    'boot',  
    'car',
    'caret',                        ## For prediction algorithms like boosting, random forest, etc 
    'chron', 
    'cluster', 
    #'clusterSim',  
    'clValid',
    'dbscan',
    'devtools',                     ## Only works on R3.2.2 or higher, to install packages from github
    'doParallel',
    'doSNOW', 
    'e1071',                        ## For naive-bayes classifier
    'ElemStatLearn',                ## Used in Coursera machine learning course
    #'epicalc', 
    'faraway',
    'flexclust',                    ## distance measures and centroid computation for clustering
    'foreach',
    'forecast',                     ## for time series modeling  
    'fpc',                          ## For cluster comparisons ## Wont install on lmcg
    'gam', 
    'gdata', 
    'glmnet', 
    'ggfortify',                    ## For plotting lm() and glm() diagnostic plots
    'ggplot2',
    'GGally',                       ## For plotting functions like ggpairs
    'graphics', 
    'gridExtra', 
    'gsubfn', 
    'gtools', 
    'Hmisc',
    'hunspell',                  ## To parse text, spell check
    'jpeg',	                    ## To read/write jpg images
    'kernlab', 
    'knitr',
    'kSamples',                     ## For k-sample Anderson-Darling test
    #'limma', 
    'lme4',
    'lmerTest',            
    'lmtest',  
    'lpSolve', 
    'lubridate', 
    'maps', 
    'maptools', 
    'mAr', 
    'matrixStats', 
    'mclust',
    'memisc',                       ## For better display of outputs in R markdown
    'mgcv', 
    #'NCStats',                      ## For chi-square post hoc tests
    'nlme', 
    'nortest', 
    'numDeriv',                     ## To calculate gradient, hessian, jacobian of functions
    'nws',
    'orthogonalsplinebasis',
    'pander',                       ## For better R markdown outputs
    'pdfCluster',   	            ## Cluster pdfs from mixtures, non-parametric
    'pgmm',                         ## Used in Coursera machine learning course
    'plotrix', 
    'pls', 
    'plyr',  
    'png',                          ## To read and write png images
    'profr',  
    'psych', 
    'quantreg',
    #'rattle',                       ## To get better plots of regression tree outputs
    'R2HTML', 
    'rbenchmark', 
    'Rcpp',
    'readr',  		            ## Read flat/tabular text files from disk
    'refund',                       ## Required by Pomann_Staicu_etal 2 sample tests
    'reshape',  
    'reshape2',
    'RFunctionsSN',
    #'RMySQL',   
    'robustbase', 
    'robustX',                      ## For multivariate median and other experimental stats
    'rpart',                        ## Used in Coursera machine learning course
    'RJSONIO',                      ## Required by animint
    #'Rsymphony', 
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
    'survey', 
    'svMisc',
    'tm',                           ## Text mining package
    'tseries', 
    'TTR', 
    'urca',
    'UsingR',    
    'vrtest', 
    'wle', 
    'wordcloud', 
    'xgboost',                      ## Extreme Gradient Boosting
    'XML', 
    'xtable', 
    'zipcode', 
    'zoo'
  )
  return(Packages)  
}

Packages <- fn_getPackages_Amazon()

Packages_Installed <- Packages
Packages_notInstalled <- c()
## For loop for requiring packages and installing them if something doesnt exist
for(Package in Packages){
  if(require(package=Package, character.only=T) == F){
    Packages_notInstalled <- c(Packages_notInstalled, Package)
    Packages_Installed <- Packages_Installed[Packages_Installed != Package]
  } else{
    require(package=Package, character.only=T)
  }
}

## For parallel processing, when passing the list of packages to load
## in all the cores. Could be different from Packages
MyAutoLoads <- Packages_Installed
Packages_Par <- MyAutoLoads

print("Following packages not installed")
print(Packages_notInstalled)
