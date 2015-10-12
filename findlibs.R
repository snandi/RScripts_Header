# For now we need miniCRAN
library(miniCRAN)
#library(igraph)

# loop and recurse through expressions as needed, finding all the 
# "library" and "require" calls.
findlibs.all <- function(expr)
{
    libs <- NULL
    if (is.expression(expr) || is.call(expr))
    {   
        words <- as.character(as.list(expr))
        if (length(words) == 2)
        {
            func_name <- words[1]
            arg_name <- words[2]
            if ((func_name == "library") || (func_name == "require"))
                return(arg_name)
            else if (func_name == "source")
                return(findlibs.Rfile(arg_name))
        }
        for (i in 1:length(expr))
            libs <- c(libs, findlibs.all(expr[[i]]))
    }
    return(libs)
}

# Convert R file to expressions and begin recursion with findlibs.all.
# This function may also be part of the recursion.
findlibs.Rfile <- function(Rfile)
{
    return(findlibs.all(parse(Rfile)))
}

# Deal with repositories.  The current logic will default to the Iowa State
# mirror, unless one or more are specified.  If Bioconductor is installed, 
# it'll add those too.  
getrepos <- function(ignore.Bioconductor)
{
    repos <- c("http://streaming.stat.iastate.edu/CRAN/")
    if (is.installed("BiocInstaller") && !ignore.Bioconductor)
    {
        library("BiocInstaller", quiet=TRUE)
        repos <- biocinstallRepos()
    }
    return(repos)
}

# Search R function or .R file for library dependencies.
findlibs <- function(fileOrLibs, repos=NULL, ignore.Bioconductor=FALSE)
{
    libs <- NULL
    deps <- NULL
    libs.ordered <- NULL
    if (is.null(repos))
        repos <- getrepos(ignore.Bioconductor)
    if (is.character(fileOrLibs) && file.exists(fileOrLibs)){
        libs <- findlibs.Rfile(fileOrLibs)
      } else{
        libs <- fileOrLibs
        print(libs)
      }
    if (!is.null(libs))
    {
        deps <- makeDepGraph(unique(libs), suggests=FALSE, repos=repos)
        libs.ordered <- V(deps)$name[topological.sort(deps)]
    }
    return(libs.ordered)
}

# Check if a package is installed
is.installed <- function(pkgname)
{ 
    return(is.element(pkgname, installed.packages()[,1]))
}

# Download libraries and return the download list
dllibs <- function(libList, destdir=".", ignore.Bioconductor=FALSE, repos=NULL)
{
    if (!file.exists(destdir))
        dir.create(destdir, recursive=TRUE)
    if (is.null(repos))
        repos <- getrepos(ignore.Bioconductor)
    # Downloading them will make a list
    dled <- download.packages(libList, destdir=destdir, repos=repos, type="source")
    return(dled)    
}

# Print out an rlibs string from the info coming back from the download.
rlibs <- function(downloaded)
{
    strings <- downloaded[,2]
    trim.dot <- function(string) { return(sub("^./", "", string))}
    strings <- vapply(strings, trim.dot, c(""))
    print(paste("rlibs", paste(strings, collapse=","), sep="="))
}



fn_prepareDependencies <- function(Pkgs){
  repos <- getOption("repos")
  availPkgs <- pkgAvail(repos = repos, type = 'source')
  Pkgs_wDep <- c()
  
  for(pkg in Pkgs){
    Pkgs_wDep <- unique(c(p_dep <- unique(unlist(tools::package_dependencies(packages=pkg, db = availPkgs, 
                                                                             which = c("Imports", "Depends", "LinkingTo"), recursive = TRUE))), 
                          Pkgs_wDep))
  }
  
  Pkgs <- unique(c(Pkgs_wDep, Pkgs))
  Pkgs_wDep <- c()
  
  Repeat <- TRUE
  while(Repeat == TRUE){
    i <- 3
    for(i in 1:length(Pkgs)){
      #print(i)
      pkg <- Pkgs[i]
      #print(pkg)
      p_dep <- unlist(tools::package_dependencies(packages=pkg, db = availPkgs, 
                                                  which = c("Imports", "Depends", "LinkingTo"), recursive = TRUE))
      Pkgs_wDep <- unique(c(Pkgs_wDep, p_dep, pkg))
    }
    
    if(length(Pkgs) == length(Pkgs_wDep)){
      if(sum(Pkgs != Pkgs_wDep) == 0){
        Repeat <- FALSE
      }  
    }
    #     print(Pkgs)
    #     print(Pkgs_wDep)
    Pkgs <- Pkgs_wDep
    Pkgs_wDep <- c()
  }
  return(Pkgs)  
}
