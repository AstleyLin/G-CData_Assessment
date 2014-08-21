## 2014 - 08 - 21 ##

This repository cotains the following files:
- run_analysis.R
- CodeBook.md
- DataExtract.csv
- MeanStdByActSub.csv

The "run_analysis.R" file is the R code that was used to do the following:
1) Transform the original dataset into a tidy format which have standart format of each column and contain 10299 data points in the dataset. And as the assignment argued, it was extracted only for mean and standard deviation measures. For the details of each column please see the description of columns of codebook.md file. 
2) The original data set are subject_train.txt, X_train.txt, y_train.txt, features.txt and activity_labels.txt, the front 3 files are training version. And the testing version files are test_train.txt, X_test.txt and y_test.txt in test folder. Loading all these data and combine into one data with some data clean are as script file run_analysis.R did. The clean include do some replacement of words for the features.txt, since it contains the comma symbol, use '@' to replace that for the future consideration of saving data as csv file.
3) Produce MeanStdByActSub.csv which is mean for each activity and each subject which use the tidy dataset to create in step 5 of the instructions. 



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
