pollutantmean <- function(directory, pollutant, id = 1:332)
{
        pollutantData <- c()
        
        
        
        for (i in 1:length(id))
        {
                if (id[i] < 10)
                {
                        idChar <- paste("00", id[i],".csv",sep = "")
                }
                else if(id[i] >= 10 && id[i] < 100)
                {
                        idChar <- paste("0",id[i],".csv" ,sep = "" )
                }
                else{
                        idChar <- paste(id[i], ".csv", sep = "")
                }
                
                dataDir <- paste(directory, idChar, sep = "/" )
                
                dataAdjusted <- read.csv(dataDir)
                
                dataAdjusted <- dataAdjusted[[pollutant]]
                
                dataAdjusted <- dataAdjusted[!is.na(dataAdjusted)]
                
                pollutantData <- c(pollutantData, dataAdjusted)
                
                
        }
        mean(pollutantData)
}