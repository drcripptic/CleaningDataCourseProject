## load plyr
library(plyr)
library(reshape2)

##load data
trainX <- read.table("train/X_train.txt")
testX <- read.table("test/X_test.txt")
trainY <- read.table("train/y_train.txt")
testY <- read.table("test/y_test.txt")
subjectTrain <- read.table("train/subject_train.txt")
subjectTest <- read.table("test/subject_test.txt")  
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

## combine X, Y and subject
trainData <- cbind(subjectTrain, trainY, trainX)
testData <- cbind(subjectTest, testY, testX)

## combine test and training
data <- rbind(trainData, testData)

## rename activities with verbose labels, convert subject to factor
names(data) <- c("subject", "activity", as.vector(features[,2]))
activity <- tolower(gsub("_","", activity[,2]))
data$activity <- factor(data$activity, labels=activity)
data$subject <- factor(data$subject)

## free memory by clearing unnecessary objects
remove(trainX, testX, trainY, testY, subjectTrain, subjectTest, 
       features, trainData, testData, activity)

## select only mean and std variables
data <- data[,c(1,2,grep("mean\\(\\)|std\\(\\)", names(data), ignore.case=FALSE))]

## rename variables in camelCase
tempNames <- names(data)
tempNames <- gsub("-mean\\(\\)-*", "Mean", tempNames)
tempNames <- gsub("-std\\(\\)-*", "Std", tempNames)
tempNames <- gsub("^f", "frequency", tempNames)
tempNames <- gsub("^t", "time", tempNames)
tempNames <- gsub("Acc", "Accelerometer", tempNames)
tempNames <- gsub("Gyro", "Gyroscope", tempNames)
tempNames <- gsub("Mag", "Magnitude", tempNames)
names(data) <- tempNames

## melt and dcast to get summary
dataMelt <- melt(data, id=c('subject', 'activity'))
dataSummary <- dcast(dataMelt, subject + activity ~ variable, mean)

## write summary to file
write.table(dataSummary, "tidyPhoneMotionData.txt", row.names=FALSE)