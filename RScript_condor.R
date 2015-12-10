##############################################################################
## This R Script extracts the tar.gz files of the R packages needed by a
## script to prepare the RLibs wrapper in chtc
##############################################################################

rm(list = ls(all.names = TRUE))
rm(list = objects(all.names = TRUE))
#dev.off()
## Filename 1
source('~/RScripts/findlibs.R')
## Filename 2
Dest_Dir <- '~/RScripts/condor_packages/'

Packages <- c(
  'boot',
  'car',
  'cluster',
  'clusterSim',
  'clValid',
  'doParallel',  ## For parallel execution with foreach
  'fda',
  'fdakma',
  'fdasrvf',
  'foreach',
  'ggplot2',
  'gridBase',
  'gridExtra',
  'gtools',
  'lattice',
  'mclust',
  'png',
  'plyr',
  'reshape',
  'reshape2',
  'robustX'   ## For multivariate median
)

Pkgs_wDep <- fn_prepareDependencies(Pkgs = Packages)

Pkgs_List <- dllibs(
  libList             = Pkgs_wDep, 
  destdir             = Dest_Dir, 
  ignore.Bioconductor = F, 
  repos               = c("http://mirror.las.iastate.edu/CRAN/")
)

RLibs <- rlibs(Pkgs_List)
DirPattern <-  paste0(gsub(pattern = '~/', replacement = '', x = Dest_Dir))

RLibs <- gsub(pattern = DirPattern, replacement = '', x = RLibs)
RLibs <- gsub(pattern = '/', replacement = '', x = RLibs)

Filename <- paste0(Dest_Dir, 'RLibs.txt')
cat(RLibs, file = Filename, sep = '\n', append = FALSE)

