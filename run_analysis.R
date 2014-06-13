require(plyr)

#extraction: feature names, x values, y values, subject ID's from test and training
featurenames<-read.table("UCI HAR Dataset/features.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")

ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")

xtest.subID<-read.table("UCI HAR Dataset/test/subject_test.txt")
xtrain.subID<-read.table("UCI HAR Dataset/train/subject_train.txt")

#combine test and trial for id, x, and y separately, add appropriate names
subID<-rbind(xtest.subID,xtrain.subID)
names(subID)="ID"

xall<-rbind(xtrain,xtest)
names(xall)=featurenames[,2]

yall<-rbind(ytest,ytrain)
names(yall)="activityType"


#Subset x vals to only mean and std features
targvars<-grep("mean|std",names(xall), value=TRUE)
xall<-xall[,targvars]

#attach ID and y to x values
phone.dat<-cbind(yall,xall,subID)

#clean up intermediate steps
rm(list=c("featurenames","subID","xall","xtest","xtest.subID","xtrain","xtrain.subID","ytest","ytrain","yall","targvars"))

#compute means of each col for each ID
subj.activity.means<-ddply(phone.dat, .(ID,activityType), numcolwise(mean))