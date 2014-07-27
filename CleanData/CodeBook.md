
The script will download the data set file from the link provided in course project assignment. The downloaded file will be saved as dataset.zip
The dataset.zip will be unzip. Sub-folder "UCI HAR Dataset" contains all the data set will be created in current directory
The script will load the data set to memory

- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt
- features.txt
- activity_labels.txt

The proper name will be assign to colums of the data frame. test and train data will be combined. Only the colums with name contains "mean" or "std" will be choosen
Add ActivityName to the combined data set according to activity
Update the column names as described below
1. std -> Std
2. mean -> Mean
3. remove "()"
4. remove "-"
5. replace the first 't' to "Time"
6. replace the first 'f' to "Freq"

Save the final data set to TidyData.txt

Creates a second, independent tidy data set with the average of each variable for each activity and each subject

Save the new tidy data to newTidyDta.txt


Results from the script
> source("run_analysis.r")

Download  http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
trying URL 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 Mb)
opened URL
downloaded 59.7 Mb


Download at  Sun Jul 27 03:11:35 2014
Dim of sub_train:  7352 1
Dim of x_train:  7352 561
Dim of y_train:  7352 1
Dim of sub_test:  2947 1
Dim of x_test:  2947 561
Dim of y_test:  2947 1
Dim of x_combine:  10299 561
Dim of y_combine:  10299 1
Dim of sub_combine:  10299 1
Dim of x_meanstd:  10299 79
Update names to:  ActivityID TimeBodyAccMeanX TimeBodyAccMeanY TimeBodyAccMeanZ TimeBodyAccStdX TimeBodyAccStdY TimeBodyAccStdZ TimeGravityAccMeanX TimeGravityAccMeanY TimeGravityAccMeanZ TimeGravityAccStdX TimeGravityAccStdY TimeGravityAccStdZ TimeBodyAccJerkMeanX TimeBodyAccJerkMeanY TimeBodyAccJerkMeanZ TimeBodyAccJerkStdX TimeBodyAccJerkStdY TimeBodyAccJerkStdZ TimeBodyGyroMeanX TimeBodyGyroMeanY TimeBodyGyroMeanZ TimeBodyGyroStdX TimeBodyGyroStdY TimeBodyGyroStdZ TimeBodyGyroJerkMeanX TimeBodyGyroJerkMeanY TimeBodyGyroJerkMeanZ TimeBodyGyroJerkStdX TimeBodyGyroJerkStdY TimeBodyGyroJerkStdZ TimeBodyAccMagMean TimeBodyAccMagStd TimeGravityAccMagMean TimeGravityAccMagStd TimeBodyAccJerkMagMean TimeBodyAccJerkMagStd TimeBodyGyroMagMean TimeBodyGyroMagStd TimeBodyGyroJerkMagMean TimeBodyGyroJerkMagStd FreqBodyAccMeanX FreqBodyAccMeanY FreqBodyAccMeanZ FreqBodyAccStdX FreqBodyAccStdY FreqBodyAccStdZ FreqBodyAccMeanFreqX FreqBodyAccMeanFreqY FreqBodyAccMeanFreqZ FreqBodyAccJerkMeanX FreqBodyAccJerkMeanY FreqBodyAccJerkMeanZ FreqBodyAccJerkStdX FreqBodyAccJerkStdY FreqBodyAccJerkStdZ FreqBodyAccJerkMeanFreqX FreqBodyAccJerkMeanFreqY FreqBodyAccJerkMeanFreqZ FreqBodyGyroMeanX FreqBodyGyroMeanY FreqBodyGyroMeanZ FreqBodyGyroStdX FreqBodyGyroStdY FreqBodyGyroStdZ FreqBodyGyroMeanFreqX FreqBodyGyroMeanFreqY FreqBodyGyroMeanFreqZ FreqBodyAccMagMean FreqBodyAccMagStd FreqBodyAccMagMeanFreq FreqBodyBodyAccJerkMagMean FreqBodyBodyAccJerkMagStd FreqBodyBodyAccJerkMagMeanFreq FreqBodyBodyGyroMagMean FreqBodyBodyGyroMagStd FreqBodyBodyGyroMagMeanFreq FreqBodyBodyGyroJerkMagMean FreqBodyBodyGyroJerkMagStd FreqBodyBodyGyroJerkMagMeanFreq Subject ActivityName
Write tidy data to file:  .\TidyData.txt
Dim of newTidyData:  180 81
Write second tidy data to file:  .\NewTidyData.txt

