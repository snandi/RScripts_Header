source('~/RScripts/Install_Packages.R')

Packages <- fn_getPackages()

## Choose USA (IA) as the CRAN mirror
Mirrors <- getCRANmirrors(all = FALSE, local.only = FALSE)
chooseCRANmirror(graphics = F, ind = which(Mirrors$Name == 'USA (IA)'))

Packages_Installed <- Packages
## For loop for requiring packages and installing them if something doesnt exist
for(Package in Packages){
  if(require(package=Package, character.only=T) == F){
    print(paste(Package, 'not Installed'))
    Packages_Installed <- Packages_Installed[Packages_Installed != Package]
#     try(install.packages(Package, dependencies = TRUE))
  } else{
#    print(paste(Package, 'already exists'))
    require(package=Package, character.only=T)
  }
}

## For parallel processing, when passing the list of packages to load
## in all the cores. Could be different from Packages
MyAutoLoads <- Packages_Installed
Packages_Par <- MyAutoLoads


