corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0

    ## Return a numeric vector of correlations
  completeCounts <- complete(directory)
  overThreshold <- completeCounts[completeCounts$nobs > threshold,][,1]
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  filenames <- filenames[overThreshold]
  frameList <- lapply(filenames, read.csv)
  frameList <- lapply(frameList, na.omit)
#   lengths <- simplify2array(lapply(frameList, function(x) length(x[,1])))
#   lengths <- lengths > threshold
#   frameList <- frameList[lengths]
  cors <- lapply(frameList, function(x) cor(x$nitrate, x$sulfate))
  cors <- simplify2array(cors)
}
