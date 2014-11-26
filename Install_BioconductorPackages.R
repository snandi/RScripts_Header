source("http://bioconductor.org/biocLite.R")

## To install a selection of core Bioconductor packages, use
#biocLite()

## To update all your installed packages, use:
biocLite(character(), ask=FALSE)

## To install packages, use:
biocLite("BiocUpgrade")
biocLite('weaver')

biocLite('annotate')
biocLite('AnnotationDbi')
biocLite('Biostrings')
biocLite('DBI')
biocLite('GO.db')
biocLite('hgu133plus2.db')
biocLite('hgu95av2.db')
biocLite('hopach')
biocLite('KEGG.db')
biocLite('reactome.db')
biocLite('seqinr')

## To install packages related to microarray data analysis:
biocLite("limma") 
biocLite("affy") 
biocLite("hgu95av2") 
biocLite("estrogen") 
biocLite("hgu95av2cdf") 
biocLite("simpleaffy") 
biocLite("annotate") 
biocLite("XML")
biocLite("leukemiasEset")
