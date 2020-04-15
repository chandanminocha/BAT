## Please save " RSolutions" Folder on your desktop
##update the computername as your systemname


#----- Setting up Working Directory-------#
computername<-'Chan'

folder<-paste('/Users/',computername,'/Desktop/RSolutions',sep='')
getwd()
setwd(folder)
getwd()

## This function will take the filename as input.
## Will check which all columns are numeric and calculate the Mean and STDDev
## Will simply mentioned if Columns Types are Character

meanandstddev<-function(x)
{
  file=read.csv(file=x,header = TRUE,stringsAsFactors = FALSE)
  student<-data.frame(file)
  ColClass<-sapply(student,class)
  for (val in 1:length(ColClass))
  {
    #cat((ColClass[val]))
    if (ColClass[val]=="integer")
    {
      cat("\n")
      cat(paste("Integer Column - ", names(ColClass[val]), "\n" ))
      Totalsum=sum(student[val])
      TotalRow=nrow(student[val])
      Meanof=Totalsum/TotalRow
      stddev=sqrt((sum((Meanof-student[val])^2)/(TotalRow-1)))
      
      cat(paste("Sum of - ",names(ColClass[val]), "Column - ", Totalsum,"\n" ))
      cat(paste("Count of - ",names(ColClass[val]),"Column - " ,TotalRow,"\n" ))
      cat(paste("Mean of - ",names(ColClass[val]),"Column - " ,Meanof,"\n" ))
      cat(paste("Standard Dev of - ",names(ColClass[val]),"Column - " ,stddev,"\n" ))  
    }
    if (ColClass[val]=="character")
    {
      cat(paste("Character Column - ", names(ColClass[val]), "\n" ))
    }
    
  }
}


filename<-("batdataset.csv")
meanandstddev(filename)


