## Please save " RSolutions" Folder on your desktop
##update the computername as your systemname


#----- Setting up Working Directory-------#
computername<-'Chan'

folder<-paste('/Users/',computername,'/Desktop/RSolutions',sep='')
getwd()
setwd(folder)
getwd()

## This function will take the filename as input.
## Will run linear reg model and find the intercept and slope
## Will create cost function and run grad descent and will provide theta output.


filename<-("batdataset.csv")
file=read.csv(file=filename,header = TRUE,stringsAsFactors = FALSE)
student<-data.frame(file)
student
plot(student$Attendance,student$EndTermMarks)
res<-lm(student$EndTermMarks ~ student$Attendance)



# squared error cost function
cost <- function(X, y, theta) {
  sum( (X %*% theta - y)^2 ) / (2*length(y))
}

# learning rate and iteration limit
alpha <- 0.01
num_iters <- 100

# keep history
cost_history <- double(num_iters)
theta_history <- list(num_iters)

# initialize coefficients
theta <- matrix(c(0,0), nrow=2)

# add a column of 1's for the intercept coefficient
X <- cbind(1, student$Attendance)
y<-student$EndTermMarks

for (i in 1:num_iters) {
  error <- (X %*% theta - y)
  delta <- t(X) %*% error / length(y)
  theta <- theta - alpha * delta
  cost_history[i] <- cost(X, y, theta)
  theta_history[[i]] <- theta
}

print(theta)
print(res)
mse=(sum(res$residuals^2))/nrow(student)
print(paste("MSE is ",mse))
