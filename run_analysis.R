#The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series 
# of yes/no questions related to the project. You will be required to submit: 
#1) a tidy data set as described below, 
#2) a link to a Github repository with your script for performing the analysis, and 
#3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up 
#  the data called CodeBook.md. 
#You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and 
# how they are connected.  





###### You should create one R script called run_analysis.R that does the following. 
### 1. Merges the training and the test sets to create one data set.
DataLoader <- function(DataDir, type=c("train","test")[1]) {
    setwd(DataDir)
    file.vt <- c("./train/subject_train.txt","./train/X_train.txt","./train/y_train.txt",
                "features.txt","activity_labels.txt")
    names(file.vt) <- c("subject","X","y","feature","activity")
    if(type == "test") file.vt <- gsub("train", "test", file.vt)
    
    subject <- read.table(file.vt["subject"], header=F, sep=" ")[,1]
    X_train <- readLines(file.vt["X"]) 
    X_train <- unlist(lapply(X_train, FUN=strsplit, split=" "))
    X_train <- as.numeric(X_train[X_train != ""])
    X_train <- matrix(X_train, ncol=561, byrow=T)
    #print(head(X_train, n=2L))
    feature <- read.table(file.vt["feature"], header=F, sep=" ")[,2] 
    feature <- gsub(",", "@", feature)
    colnames(X_train) <- feature
    y_train <- read.table(file.vt["y"], header=F, sep=" ")[,1]
    activity <- read.table(file.vt["activity"], header=F, sep=" ")[,2] 
    names(activity) <- 1:length(activity)
    data.df <- data.frame("Subject"=subject, "Activity"=activity[y_train], X_train, 
                    check.names=F, stringsAsFactors=F)
    return(data.df)
}

Wdir <- "D:\\Miscellaneous\\Google~1\\eLearn\\Johns Hopkins_Data Science\\Getting and Cleaning Data\\Assignment\\UCI HAR Dataset"
Train.df <- DataLoader(Wdir, type="train")
Test.df <- DataLoader(Wdir, type="test")     
print(nrow(Train.df))
print(nrow(Test.df))
Data.df <- rbind(Train.df, Test.df)
print(head(Data.df, n=2L)); print(nrow(Data.df))





### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#mean(): Mean value
#std(): Standard deviation
select.fg <- grepl("mean\\(\\)", names(Data.df)) | grepl("std\\(\\)", names(Data.df))
Data.df <- Data.df[, c("Subject","Activity",names(Data.df)[select.fg])]
print(colnames(Data.df))
#write.csv(Data.df, "DataIntegrated.csv")




 
### 3. Uses descriptive activity names to name the activities in the data set
print("Already done on question 1")
print(table(Data.df[, "Activity"]))





### 4. Appropriately labels the data set with descriptive variable names. 
FeatureInfo <- readLines("features_info.txt") 
# for feature name
Substitute <- c("body signal of", "gravity signal of", "body Fast Fourier Transform of", "",
                " acceleration", " gyroscope", " derived to Jerk signals", " using the Euclidean norm")
Candidate <- c("tBody", "tGravity", "fBody", "-XYZ",   
                "Acc", "Gyro", "Jerk", "Mag")
FeatureDesc <- FeatureInfo[13:29]
for(i in 1:length(Substitute)) FeatureDesc <- gsub(Candidate[i], Substitute[i], FeatureDesc)
names(FeatureDesc) <- gsub("-XYZ", "", FeatureInfo[13:29])
# for ststistic
AggreFunc <- matrix(unlist(strsplit(FeatureInfo[33:49], ": ")), ncol=2, byrow=T)
AggreFuncDesc <- AggreFunc[,2]
AggreFuncDesc <- gsub("of each window.", "of each window", AggreFuncDesc)
names(AggreFuncDesc) <- AggreFunc[,1]
arCoeffDesc <- AggreFuncDesc[grep("arCoeff()", AggreFunc)]
arCoeffDesc <- rep(arCoeffDesc, 4); names(arCoeffDesc) <- paste("arCoeff()", 1:4, sep="")
AggreFuncDesc <- c(AggreFuncDesc, arCoeffDesc)
# for angle variable
AngleVarDesc <- c("mean of gravity signal", 
                "mean of acceleration of body signal", "mean of acceleration derived to Jerk signals of body signal", 
                "mean of gyroscope of body signal", "mean of gyroscope derived to Jerk signals of body signal")
names(AngleVarDesc) <- FeatureInfo[53:57]
# grep data and attach it's description
vtColname <- names(Data.df)[-(1:2)]
lsColname <- strsplit(vtColname, "-")
lsLength <- sapply(lsColname, FUN=length)
mxColname3 <- t(matrix(unlist(lsColname[which(lsLength == 3)]), nrow=3))
mxColname3[,3] <- gsub("Z", "Z-axis", gsub("Y", "Y-axis", gsub("X", "X-axis", mxColname3[,3]), mxColname3[,3]), mxColname3[,3])
FreqInterval <- grepl("\\@", mxColname3[,3]) & !(grepl("X", mxColname3[,3]) | grepl("Y", mxColname3[,3]) | grepl("Z", mxColname3[,3])) 
mxColname3[FreqInterval,3] <- paste("interval", gsub("\\@", " to ", mxColname3[FreqInterval,3]))
Desc <- paste(AggreFuncDesc[mxColname3[,2]], " to ", FeatureDesc[mxColname3[,1]], " in ", mxColname3[,3], sep="")
mxColname3 <- cbind("ColumnName"=vtColname[which(lsLength == 3)], "Description"=Desc)
head(mxColname3)
mxColname2 <- t(matrix(unlist(lsColname[which(lsLength == 2)]), nrow=2))
mxColname2[,1] <- gsub("fBodyBody", "fBody", mxColname2[,1])
Desc <- paste(AggreFuncDesc[mxColname2[,2]], " to ", FeatureDesc[mxColname2[,1]], sep="")
mxColname2 <- cbind("ColumnName"=vtColname[which(lsLength == 2)], "Description"=Desc)
head(mxColname2)
mxColname1 <- unlist(lsColname[which(lsLength == 1)])
mxColname1 <- gsub("angle\\(", "Angle between ", mxColname1)
mxColname1 <- gsub(")", "", mxColname1)
mxColname1 <- gsub("\\@", " and ", mxColname1)
for(i in 1:length(AngleVarDesc)) mxColname1 <- gsub(names(AngleVarDesc)[i], AngleVarDesc[i], mxColname1)
mxColname1 <- cbind("ColumnName"=vtColname[which(lsLength == 1)], "Description"=mxColname1)
dfColname <- as.data.frame(rbind(mxColname3, mxColname2, mxColname1))
print(head(dfColname))





#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
select.fg <- !is.element(colnames(Data.df), c("Activity","Subject"))
lsBy <- list("Activity"=Data.df[,"Activity"], "Subject"=Data.df[,"Subject"])
Agg.df <- aggregate(Data.df[, select.fg], by=lsBy, FUN=mean, na.rm=T)
print(head(Agg.df)); print(dim(Agg.df))
write.table(Agg.df, "MeanStdByActSub.csv", row.name=FALSE, sep=",")




















