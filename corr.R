corr <- function(directory, threshold = 0)
{

        corrVector <- c()
        
        
        for (i in 1:332)
        {
                if (i < 10)
                {
                        idChar <- paste("00", i, ".csv", sep = "")
                }
                else if (i < 100 && i >= 10)
                {
                        idChar <- paste("0", i, ".csv", sep = "")
                }
                else{
                        idChar <- paste(i, ".csv", sep = "")
                }
                
                dataDir <- paste(directory, idChar, sep = "/")
                theData <- read.csv(dataDir)
                
                observedCases <- complete.cases(theData)
                
                thresholdComp <- length(observedCases[observedCases == TRUE])
                
                if (thresholdComp > threshold)
                {
                        theData <- theData[observedCases == TRUE,]
                        corrVector <- c(corrVector,cor(theData$sulfate, theData$nitrate))
                        
                }
                
                
        }
        
        
        
        corrVector
        

}