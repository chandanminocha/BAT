## Please save " RSolutions" Folder on your desktop
##update the computername as your systemname


#----- Setting up Working Directory-------#
computername<-'Chan'

folder<-paste('/Users/',computername,'/Desktop/RSolutions',sep='')
getwd()
setwd(folder)
getwd()

## This function will take the filename as input.
## Will create a new Column "Male" and assign the value 1 if gender is "Male"
## Will remove the Gender column and returns the dataframe.

meanandstddev<-function(x)
{
  file=read.csv(file=x,header = TRUE,stringsAsFactors = FALSE)
  student<-data.frame(file)
  #print(student)
  student$Male<-ifelse(student$Gender=="M",1,0)
  student$Gender<-NULL
  print(student)
}


filename<-("batdataset.csv")
meanandstddev(filename)
