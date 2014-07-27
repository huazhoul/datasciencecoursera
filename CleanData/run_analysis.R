
## Clean up
rm(list=ls())

## Download the data file and unzip
srcFile <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- ".\\dataset.zip"

cat("\nDownload ", srcFile)
cat("\n")
download.file(srcFile, destfile = destFile)
unzip(destFile)

## Query current time
dateDownloaded <- date()
cat("\nDownload at ", dateDownloaded)

## STEP 1 : Merges the training and the test sets to create one data set.

## Read train and test data set

sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
cat("\nDim of sub_train: ", dim(sub_train))
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
cat("\nDim of x_train: ", dim(x_train))
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
cat("\nDim of y_train: ", dim(y_train))

sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
cat("\nDim of sub_test: ", dim(sub_test))
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
cat("\nDim of x_test: ", dim(x_test))
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
cat("\nDim of y_test: ", dim(y_test))


## Combine training and test set

x_combine = rbind(x_train, x_test)
cat("\nDim of x_combine: ", dim(x_combine))
y_combine = rbind(y_train, y_test)
cat("\nDim of y_combine: ", dim(y_combine))
sub_combine = rbind(sub_train, sub_test)
cat("\nDim of sub_combine: ", dim(sub_combine))

## Read features
features <- read.table("./UCI HAR Dataset/features.txt")

## Add names to the table

names(x_combine) <- features[,2]
names(y_combine) <- c("ActivityID")
names(sub_combine) <- c("Subject")

## STEP 2 : Extracts only the measurements on the mean and standard deviation for each measurement.

## Find the colums for mean and std
colIndx <- grep("mean|std", names(x_combine))
x_meanstd <- x_combine[, colIndx]
cat("\nDim of x_meanstd: ", dim(x_meanstd))

## STEP 3 : Uses descriptive activity names to name the activities in the data set

## Read activity label
act_label <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(act_label) <- c('ActivityID','ActivityName');

## Combine y and x and subject
dataCombine <- cbind(y_combine, x_meanstd, sub_combine)

## Add activity name
finalData = merge(dataCombine, act_label, by="ActivityID", all.x=TRUE);

## Remove activity id
##finalData <- subset(finalData, select = -(ActivityID))

## STEP 4 : Appropriately labels the data set with descriptive variable names.

## Create temp var to save current name
tmp <- names(finalData)

## Update names
for (i in 1:length(tmp)) 
{
	tmp[i] = sub("std", "Std", tmp[i], fixed=T)
	tmp[i] = sub("mean", "Mean", tmp[i], fixed=T)
	tmp[i] = sub("()", "", tmp[i], fixed=T)
	tmp[i] = gsub("-", "", tmp[i], fixed=T)
	tmp[i] = sub("^t", "Time", tmp[i], fixed=FALSE)
	tmp[i] = sub("^f", "Freq", tmp[i], fixed=FALSE)
}

## Set the new names back
names(finalData) <- tmp
cat("\nUpdate names to: ", tmp)

TidyDataFile <- ".\\TidyData.txt"
cat("\nWrite tidy data to file: ", TidyDataFile)
write.table(finalData, TidyDataFile)

## STEP 5 : Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Remove activity Name since name cannot take by mean
finalData <- subset(finalData, select = -(ActivityName))
newTidyData <-aggregate(subset(finalData, select = -c(ActivityID, Subject)), by=list(finalData$ActivityID, finalData$Subject), FUN=mean)
names(newTidyData)[1:2] <- c("ActivityID", "Subject")
cat("\nDim of newTidyData: ", dim(newTidyData))

newTidyDataFile <- ".\\NewTidyData.txt"
cat("\nWrite second tidy data to file: ", newTidyDataFile)
write.table(newTidyData, newTidyDataFile)

cat("\n")
