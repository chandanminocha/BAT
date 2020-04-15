## Please save " RSolutions" Folder on your desktop
##update the computername as your systemname


#----- Setting up Working Directory-------#
computername<-'Chan'

folder<-paste('/Users/',computername,'/Desktop/RSolutions',sep='')
getwd()
setwd(folder)
getwd()

## This function will take the filename as input.
## Will divide data set into 70/30 ratio for each gender
## Save the output as csv.

meanandstddev<-function(x)
{
  file=read.csv(file=x,header = TRUE,stringsAsFactors = FALSE)
  student<-data.frame(file)
  maledata<-subset(student,student$Gender=="M")
  Femaledata<-subset(student,student$Gender=="F")
 
  set.seed(1000)
  mtrain_ind<-sample(seq_len(nrow(maledata)),size=.7*nrow(maledata))
  mtraindata<-maledata[mtrain_ind,]
  mtestdata<-maledata[-mtrain_ind,]
  #mtraindata
  #mtestdata
 
 
  ftrain_ind<-sample(seq_len(nrow(Femaledata)),size=.7*nrow(Femaledata))
  ftraindata<-Femaledata[ftrain_ind,]
  ftestdata<-Femaledata[-ftrain_ind,]
  #ftraindata
  #ftestdata
 
  train<-rbind(mtraindata,ftraindata)
  test<-rbind(mtestdata,ftestdata)
  #print(train)
  #print(test)
  write.csv(train,file='train.csv')
  write.csv(test,file='test.csv')
}


filename<-("batdataset.csv")
meanandstddev(filename)