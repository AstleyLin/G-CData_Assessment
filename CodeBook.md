

# CodeBook for the tidy dataset  
  

## Data source  

This dataset is got from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

## Data Understanding  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.   

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. And the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  



These signals were used to estimate variables of the feature vector for each pattern:   

```
##  [1] "tBodyAcc-XYZ"      "tGravityAcc-XYZ"   "tBodyAccJerk-XYZ" 
##  [4] "tBodyGyro-XYZ"     "tBodyGyroJerk-XYZ" "tBodyAccMag"      
##  [7] "tGravityAccMag"    "tBodyAccJerkMag"   "tBodyGyroMag"     
## [10] "tBodyGyroJerkMag"  "fBodyAcc-XYZ"      "fBodyAccJerk-XYZ" 
## [13] "fBodyGyro-XYZ"     "fBodyAccMag"       "fBodyAccJerkMag"  
## [16] "fBodyGyroMag"      "fBodyGyroJerkMag"
```
where '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

The set of variables that were estimated from these signals are:  

```
##  [1] "mean(): Mean value"                                                                         
##  [2] "std(): Standard deviation"                                                                  
##  [3] "mad(): Median absolute deviation "                                                          
##  [4] "max(): Largest value in array"                                                              
##  [5] "min(): Smallest value in array"                                                             
##  [6] "sma(): Signal magnitude area"                                                               
##  [7] "energy(): Energy measure. Sum of the squares divided by the number of values. "             
##  [8] "iqr(): Interquartile range "                                                                
##  [9] "entropy(): Signal entropy"                                                                  
## [10] "arCoeff(): Autorregresion coefficients with Burg order equal to 4"                          
## [11] "correlation(): correlation coefficient between two signals"                                 
## [12] "maxInds(): index of the frequency component with largest magnitude"                         
## [13] "meanFreq(): Weighted average of the frequency components to obtain a mean frequency"        
## [14] "skewness(): skewness of the frequency domain signal "                                       
## [15] "kurtosis(): kurtosis of the frequency domain signal "                                       
## [16] "bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window."
## [17] "angle(): Angle between to vectors."
```

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

```
## [1] "gravityMean"       "tBodyAccMean"      "tBodyAccJerkMean" 
## [4] "tBodyGyroMean"     "tBodyGyroJerkMean"
```
  
## Description of data process and final integrated data  

The data set are subject_train.txt, X_train.txt, y_train.txt, features.txt and activity_labels.txt, these are training version. And the testing version are replacing the 'train' word with 'test' of subject_train.txt, X_train.txt and y_train.txt in test folder. Load both version of data and combine these data into one data as script file run_analysis.R did. Special for the features.txt, it contain the comma symbol in data filed, use '@' to replace that for the future consideration of saving data as csv file.  
And according the assignment request, only extract the measurements on the mean and standard deviation for each measurement.  


Utilize above information to make a description of each column as follows:  
  
<table border = 1>
<tr><td>
<!-- html table generated in R 3.1.0 by xtable 1.7-3 package -->
<!-- Thu Aug 21 21:53:39 2014 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> ColumnName </TH> <TH> Description </TH>  </TR>
  <TR> <TD align="right"> 1 </TD> <TD> Subject </TD> <TD> 30 volunteers </TD> </TR>
  <TR> <TD align="right"> 2 </TD> <TD> Activity </TD> <TD> Include 6 kind activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING </TD> </TR>
  <TR> <TD align="right"> 3 </TD> <TD> tBodyAcc-mean()-X </TD> <TD> Mean value to body signal of acceleration in X-axis </TD> </TR>
  <TR> <TD align="right"> 4 </TD> <TD> tBodyAcc-mean()-Y </TD> <TD> Mean value to body signal of acceleration in Y-axis </TD> </TR>
  <TR> <TD align="right"> 5 </TD> <TD> tBodyAcc-mean()-Z </TD> <TD> Mean value to body signal of acceleration in Z-axis </TD> </TR>
  <TR> <TD align="right"> 6 </TD> <TD> tBodyAcc-std()-X </TD> <TD> Standard deviation to body signal of acceleration in X-axis </TD> </TR>
  <TR> <TD align="right"> 7 </TD> <TD> tBodyAcc-std()-Y </TD> <TD> Standard deviation to body signal of acceleration in Y-axis </TD> </TR>
  <TR> <TD align="right"> 8 </TD> <TD> tBodyAcc-std()-Z </TD> <TD> Standard deviation to body signal of acceleration in Z-axis </TD> </TR>
  <TR> <TD align="right"> 9 </TD> <TD> tGravityAcc-mean()-X </TD> <TD> Mean value to gravity signal of acceleration in X-axis </TD> </TR>
  <TR> <TD align="right"> 10 </TD> <TD> tGravityAcc-mean()-Y </TD> <TD> Mean value to gravity signal of acceleration in Y-axis </TD> </TR>
  <TR> <TD align="right"> 11 </TD> <TD> tGravityAcc-mean()-Z </TD> <TD> Mean value to gravity signal of acceleration in Z-axis </TD> </TR>
  <TR> <TD align="right"> 12 </TD> <TD> tGravityAcc-std()-X </TD> <TD> Standard deviation to gravity signal of acceleration in X-axis </TD> </TR>
  <TR> <TD align="right"> 13 </TD> <TD> tGravityAcc-std()-Y </TD> <TD> Standard deviation to gravity signal of acceleration in Y-axis </TD> </TR>
  <TR> <TD align="right"> 14 </TD> <TD> tGravityAcc-std()-Z </TD> <TD> Standard deviation to gravity signal of acceleration in Z-axis </TD> </TR>
  <TR> <TD align="right"> 15 </TD> <TD> tBodyAccJerk-mean()-X </TD> <TD> Mean value to body signal of acceleration derived to Jerk signals in X-axis </TD> </TR>
  <TR> <TD align="right"> 16 </TD> <TD> tBodyAccJerk-mean()-Y </TD> <TD> Mean value to body signal of acceleration derived to Jerk signals in Y-axis </TD> </TR>
  <TR> <TD align="right"> 17 </TD> <TD> tBodyAccJerk-mean()-Z </TD> <TD> Mean value to body signal of acceleration derived to Jerk signals in Z-axis </TD> </TR>
  <TR> <TD align="right"> 18 </TD> <TD> tBodyAccJerk-std()-X </TD> <TD> Standard deviation to body signal of acceleration derived to Jerk signals in X-axis </TD> </TR>
  <TR> <TD align="right"> 19 </TD> <TD> tBodyAccJerk-std()-Y </TD> <TD> Standard deviation to body signal of acceleration derived to Jerk signals in Y-axis </TD> </TR>
  <TR> <TD align="right"> 20 </TD> <TD> tBodyAccJerk-std()-Z </TD> <TD> Standard deviation to body signal of acceleration derived to Jerk signals in Z-axis </TD> </TR>
  <TR> <TD align="right"> 21 </TD> <TD> tBodyGyro-mean()-X </TD> <TD> Mean value to body signal of gyroscope in X-axis </TD> </TR>
  <TR> <TD align="right"> 22 </TD> <TD> tBodyGyro-mean()-Y </TD> <TD> Mean value to body signal of gyroscope in Y-axis </TD> </TR>
  <TR> <TD align="right"> 23 </TD> <TD> tBodyGyro-mean()-Z </TD> <TD> Mean value to body signal of gyroscope in Z-axis </TD> </TR>
  <TR> <TD align="right"> 24 </TD> <TD> tBodyGyro-std()-X </TD> <TD> Standard deviation to body signal of gyroscope in X-axis </TD> </TR>
  <TR> <TD align="right"> 25 </TD> <TD> tBodyGyro-std()-Y </TD> <TD> Standard deviation to body signal of gyroscope in Y-axis </TD> </TR>
  <TR> <TD align="right"> 26 </TD> <TD> tBodyGyro-std()-Z </TD> <TD> Standard deviation to body signal of gyroscope in Z-axis </TD> </TR>
  <TR> <TD align="right"> 27 </TD> <TD> tBodyGyroJerk-mean()-X </TD> <TD> Mean value to body signal of gyroscope derived to Jerk signals in X-axis </TD> </TR>
  <TR> <TD align="right"> 28 </TD> <TD> tBodyGyroJerk-mean()-Y </TD> <TD> Mean value to body signal of gyroscope derived to Jerk signals in Y-axis </TD> </TR>
  <TR> <TD align="right"> 29 </TD> <TD> tBodyGyroJerk-mean()-Z </TD> <TD> Mean value to body signal of gyroscope derived to Jerk signals in Z-axis </TD> </TR>
  <TR> <TD align="right"> 30 </TD> <TD> tBodyGyroJerk-std()-X </TD> <TD> Standard deviation to body signal of gyroscope derived to Jerk signals in X-axis </TD> </TR>
  <TR> <TD align="right"> 31 </TD> <TD> tBodyGyroJerk-std()-Y </TD> <TD> Standard deviation to body signal of gyroscope derived to Jerk signals in Y-axis </TD> </TR>
  <TR> <TD align="right"> 32 </TD> <TD> tBodyGyroJerk-std()-Z </TD> <TD> Standard deviation to body signal of gyroscope derived to Jerk signals in Z-axis </TD> </TR>
  <TR> <TD align="right"> 33 </TD> <TD> fBodyAcc-mean()-X </TD> <TD> Mean value to body Fast Fourier Transform of acceleration in X-axis </TD> </TR>
  <TR> <TD align="right"> 34 </TD> <TD> fBodyAcc-mean()-Y </TD> <TD> Mean value to body Fast Fourier Transform of acceleration in Y-axis </TD> </TR>
  <TR> <TD align="right"> 35 </TD> <TD> fBodyAcc-mean()-Z </TD> <TD> Mean value to body Fast Fourier Transform of acceleration in Z-axis </TD> </TR>
  <TR> <TD align="right"> 36 </TD> <TD> fBodyAcc-std()-X </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration in X-axis </TD> </TR>
  <TR> <TD align="right"> 37 </TD> <TD> fBodyAcc-std()-Y </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration in Y-axis </TD> </TR>
  <TR> <TD align="right"> 38 </TD> <TD> fBodyAcc-std()-Z </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration in Z-axis </TD> </TR>
  <TR> <TD align="right"> 39 </TD> <TD> fBodyAccJerk-mean()-X </TD> <TD> Mean value to body Fast Fourier Transform of acceleration derived to Jerk signals in X-axis </TD> </TR>
  <TR> <TD align="right"> 40 </TD> <TD> fBodyAccJerk-mean()-Y </TD> <TD> Mean value to body Fast Fourier Transform of acceleration derived to Jerk signals in Y-axis </TD> </TR>
  <TR> <TD align="right"> 41 </TD> <TD> fBodyAccJerk-mean()-Z </TD> <TD> Mean value to body Fast Fourier Transform of acceleration derived to Jerk signals in Z-axis </TD> </TR>
  <TR> <TD align="right"> 42 </TD> <TD> fBodyAccJerk-std()-X </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration derived to Jerk signals in X-axis </TD> </TR>
  <TR> <TD align="right"> 43 </TD> <TD> fBodyAccJerk-std()-Y </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration derived to Jerk signals in Y-axis </TD> </TR>
  <TR> <TD align="right"> 44 </TD> <TD> fBodyAccJerk-std()-Z </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration derived to Jerk signals in Z-axis </TD> </TR>
  <TR> <TD align="right"> 45 </TD> <TD> fBodyGyro-mean()-X </TD> <TD> Mean value to body Fast Fourier Transform of gyroscope in X-axis </TD> </TR>
  <TR> <TD align="right"> 46 </TD> <TD> fBodyGyro-mean()-Y </TD> <TD> Mean value to body Fast Fourier Transform of gyroscope in Y-axis </TD> </TR>
  <TR> <TD align="right"> 47 </TD> <TD> fBodyGyro-mean()-Z </TD> <TD> Mean value to body Fast Fourier Transform of gyroscope in Z-axis </TD> </TR>
  <TR> <TD align="right"> 48 </TD> <TD> fBodyGyro-std()-X </TD> <TD> Standard deviation to body Fast Fourier Transform of gyroscope in X-axis </TD> </TR>
  <TR> <TD align="right"> 49 </TD> <TD> fBodyGyro-std()-Y </TD> <TD> Standard deviation to body Fast Fourier Transform of gyroscope in Y-axis </TD> </TR>
  <TR> <TD align="right"> 50 </TD> <TD> fBodyGyro-std()-Z </TD> <TD> Standard deviation to body Fast Fourier Transform of gyroscope in Z-axis </TD> </TR>
  <TR> <TD align="right"> 51 </TD> <TD> tBodyAccMag-mean() </TD> <TD> Mean value to body signal of acceleration using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 52 </TD> <TD> tBodyAccMag-std() </TD> <TD> Standard deviation to body signal of acceleration using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 53 </TD> <TD> tGravityAccMag-mean() </TD> <TD> Mean value to gravity signal of acceleration using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 54 </TD> <TD> tGravityAccMag-std() </TD> <TD> Standard deviation to gravity signal of acceleration using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 55 </TD> <TD> tBodyAccJerkMag-mean() </TD> <TD> Mean value to body signal of acceleration derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 56 </TD> <TD> tBodyAccJerkMag-std() </TD> <TD> Standard deviation to body signal of acceleration derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 57 </TD> <TD> tBodyGyroMag-mean() </TD> <TD> Mean value to body signal of gyroscope using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 58 </TD> <TD> tBodyGyroMag-std() </TD> <TD> Standard deviation to body signal of gyroscope using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 59 </TD> <TD> tBodyGyroJerkMag-mean() </TD> <TD> Mean value to body signal of gyroscope derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 60 </TD> <TD> tBodyGyroJerkMag-std() </TD> <TD> Standard deviation to body signal of gyroscope derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 61 </TD> <TD> fBodyAccMag-mean() </TD> <TD> Mean value to body Fast Fourier Transform of acceleration using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 62 </TD> <TD> fBodyAccMag-std() </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 63 </TD> <TD> fBodyBodyAccJerkMag-mean() </TD> <TD> Mean value to body Fast Fourier Transform of acceleration derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 64 </TD> <TD> fBodyBodyAccJerkMag-std() </TD> <TD> Standard deviation to body Fast Fourier Transform of acceleration derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 65 </TD> <TD> fBodyBodyGyroMag-mean() </TD> <TD> Mean value to body Fast Fourier Transform of gyroscope using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 66 </TD> <TD> fBodyBodyGyroMag-std() </TD> <TD> Standard deviation to body Fast Fourier Transform of gyroscope using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 67 </TD> <TD> fBodyBodyGyroJerkMag-mean() </TD> <TD> Mean value to body Fast Fourier Transform of gyroscope derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 68 </TD> <TD> fBodyBodyGyroJerkMag-std() </TD> <TD> Standard deviation to body Fast Fourier Transform of gyroscope derived to Jerk signals using the Euclidean norm </TD> </TR>
  <TR> <TD align="right"> 69 </TD> <TD> Activity </TD> <TD> Activity </TD> </TR>
   </TABLE>
</td>
</table>




