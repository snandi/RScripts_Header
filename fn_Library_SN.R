################################################################## 
## This is a library of functions of general use. It is recommended
## to source this file in every project
##################################################################

is.integer0 <- function(x)
{
  is.integer(x) && !length(x)
}

################################################################## 
## Returns the p-value, rounded to desired number of places, from
## a lm object
##################################################################
fn_get_pValue <- function (lmobject, Round = 6) {
  if (class(lmobject) != "lm") stop("Not an object of class 'lm' ")
  f <- summary(lmobject)$fstatistic
  p <- pf(f[1],f[2],f[3],lower.tail=F)
  attributes(p) <- NULL
  return(round(p, Round))
}

################################################################## 
## Returns the SE of mean of each row of a dataset
##################################################################
rowSE <- function(Data){
  SE <- apply(X = Data, MARGIN = 1, FUN=function(Row){sd(Row)/sqrt(length(Row))})
  return(SE)
}
################################################################## 

################################################################## 
## Returns the SD of each row/column of a dataset
##################################################################
rowSD <- function(Data){
  SD <- apply(X = Data, MARGIN = 1, FUN=function(Row){sd(Row)})
  return(SD)
}

colSD <- function(Data){
  rowSD(t(Data))
}
################################################################## 

################################################################## 
## Returns the Var of each row/column of a dataset
##################################################################
rowVar <- function(Data){
  SD <- apply(X = Data, MARGIN = 1, FUN=function(Row){var(Row)})
  return(SD)
}

colVar <- function(Data){
  rowVar(t(Data))
}
##################################################################

################################################################## 
## Truncate user-defined percentage from both sides of vector
##################################################################
trunc_vector <- function(Vector, pct_trunc_left = 10, pct_trunc_right = 10){
  ## truncates 10% from left and 10% from right by default
  Vector <- as.vector(Vector)
  N <- length(Vector)
  LeftIndex <- N*pct_trunc_left/100
  RightIndex <- N - N*pct_trunc_right/100
  
  Vector.Trunc <- Vector[LeftIndex : RightIndex]
  return(Vector.Trunc)  
}

################################################################## 
## Normalize a vector
##################################################################
normalize_vector <- function(Vector){
  Vector <- as.vector(Vector)
  Mean <- mean(Vector)
  SD <- sd(Vector)
  Vector.Normalized <- (Vector - Mean)/SD
  return(Vector.Normalized)
}

######################### Convert NAs to Zero ##########################
na.is.zero <- function(X)
{
  X1 <- X
  X1[is.na(X)] <- 0.0
  return(X1)
}
########################################################################

########################################################################
"%notin%" <- function(x, y){
  if(x %in% y){
    return(FALSE)
  } else{
    return(TRUE)
  }
}
########################################################################

########################################################################
"%w/o%" <- function(x, y){
  return(x[!x %in% y])
}
########################################################################

########################################################################
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
########################################################################


