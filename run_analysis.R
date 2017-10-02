library(dplyr)
# First block reads two files of similar datasets and merge them
testfile<-"C:/Naresh/Data Science/R/UCI HAR Dataset/test/X_test.txt"
ttfile<-read.table(testfile)
trainfile<-"C:/Naresh/Data Science/R/UCI HAR Dataset/train/X_train.txt"
trfile<-read.table(trainfile)
if(length(ttfile)!=length(trfile)){
  print("Two data sets have different length")
}
totalset<-rbind(ttfile,trfile)

#This block get the labels and merge both test and train
testheader<-"C:/Naresh/Data Science/R/UCI HAR Dataset/test/y_test.txt"
tthfile<-read.table(testheader)
trainheader<-"C:/Naresh/Data Science/R/UCI HAR Dataset/train/y_train.txt"
trhfile<-read.table(trainheader)
totalhead<-rbind(tthfile,trhfile)

#This block get the cols for all features that has "mean" and "std" values
feature_labels<-"C:/Naresh/Data Science/R/UCI HAR Dataset/features.txt"
flfile<-read.table(feature_labels)
col_numbers<-grep("mean|std",flfile[,2])
col_names<-grep("mean|std",flfile[,2],value = TRUE)
col_names<-gsub("[()-]","",col_names)
cols<-list("col_numbers"=col_numbers,"col_names"=col_names)
totalset<-totalset %>% select(cols[[1]])

#This block get the activity lables
activity_labels<-"C:/Naresh/Data Science/R/UCI HAR Dataset/activity_labels.txt"
acfile<-read.table(activity_labels)

#This block get the subject data and merge both test and train
sub_testfile<-"C:/Naresh/Data Science/R/UCI HAR Dataset/test/subject_test.txt"
sttfile<-read.table(sub_testfile)
sub_trainfile<-"C:/Naresh/Data Science/R/UCI HAR Dataset/train/subject_train.txt"
strfile<-read.table(sub_trainfile)
totalsub<-rbind(sttfile,strfile)

#This block match and creates total col names for total set
total_head_set<-acfile[match(totalhead[,1],acfile[,1]),2]

#This block combines total set, acitivity and subjects
totalset<-cbind(totalset,total_head_set,totalsub)

#This block assigns column names to total set
names(totalset)<-c(cols[[2]],"activitynames","subject")

#This block creates tidy data set with average of each variable for each activity and subject
averageset<-totalset %>% group_by(activitynames,subject) %>% summarise_all(mean)

write.table(averageset,file="C:/Naresh/Data Science/R/UCI HAR Dataset/Assignment/tidy_data_set.txt",row.names = FALSE)
