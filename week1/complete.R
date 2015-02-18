complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  filenames <- filenames[id]
  frameList <- lapply(filenames, read.csv)
  dataFrame <- do.call("rbind", frameList)
  dataFrame <- na.omit(dataFrame)
  dataTime <- table(dataFrame$ID)
  rval <- data.frame(dataTime)
  names(rval) <- c("id", "nobs")
  rval
}
