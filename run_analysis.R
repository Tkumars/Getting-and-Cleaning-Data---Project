library(plyr)

train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")

test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")

data_x <- rbind(train_x,test_x)
data_y <- rbind(train_y,test_y)
data_subject <- rbind(train_subject,test_subject)

features <- read.table("features.txt")

mean_and_std <- grep("-(mean|std)\\(\\)",features[,2])

data_x <- data_x[,mean_and_std]

names(data_x) <- features[mean_and_std,2]

activities <- read.table("activity_labels.txt")

data_y[,1] <- activities[data_y[,1],2]

names(data_y) <- "activity"

names(data_subject) <- "subject"

complete_data <- cbind(data_x,data_y,data_subject)

avg_data <- ddply(complete_data,.(subject,activity),function(x) colMeans(x[,1:66]))

write.table(avg_data,"avg_data.txt",row.names = FALSE)





