## Please save " RSolutions" Folder on your desktop
##update the computername as your systemname


#----- Setting up Working Directory-------#
computername<-'Chan'

folder<-paste('/Users/',computername,'/Desktop/RSolutions',sep='')
getwd()
setwd(folder)
getwd()

## This function will take the filename as input.
## Will check which all columns are numeric and calculate the Mean,STDDev,ZScore
## Will replace numeric column with Zscrore and print the dataframe

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
      Totalsum=sum(student[val])
      TotalRow=nrow(student[val])
      Meanof=Totalsum/TotalRow
      stddev=sqrt((sum((Meanof-student[val])^2)/(TotalRow-1)))
      
      Zscore_data<-(student[val]-Meanof)/stddev
      student[val]<-Zscore_data
      #print(student[val])
      #print(Zscore_Attendance)
    }
  }
  print(student)
}


filename<-("batdataset.csv")
meanandstddev(filename)
