complete <- function(directory, id = 1:332)
{
        nobs <- c()
        
        for (i in 1:length(id))
        {
                naCount <- 0
                
                
                
                if (id[i] < 10)
                {
                        idChar <- paste("00", id[i], ".csv", sep = "")
                }
                else if (id[i] < 100 && id[i] >= 10)
                {
                        idChar <- paste("0", id[i], ".csv", sep = "")
                }
                else{
                        idChar <- paste(id[i], ".csv", sep = "")
                }
                
                dataDir <- paste(directory, idChar, sep = "/")
                theData <- read.csv(dataDir)
                
                
                naLogical <- complete.cases(theData)
                
                observedCases <- naLogical[naLogical == TRUE]
                
                
                
                nobs <- c(nobs, length(observedCases))
                
                
                
        
        }
        
        finalData <- data.frame(id = id, nobs = nobs)
        
        finalData
        
}
