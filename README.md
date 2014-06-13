ReadMe
========================================================

The script requires the package plyr and assumes it is being run in a directory containing a folder named "UCI HAR DATAset", as created by unzipping https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It first extracts feature names, x measurements, y activities, and subject id's from test and training sets using read.table on the respective files.
For each data source, test and training sets are concantenated by row.
Column names are added, "ID" for subject id's extracted from 'subject' data, 'activityType' for 'y' data, and the names extracted from 'features.txt' for the 'x' data. 

'x' data are subset to only those columns with names containing 'mean' or 'std'.

x,y,and ID data frames are then combined by column into a single data frame. This data frame is called phone.dat.

A second data frame is derived from this one by computing the column means for each participant in each activity. This data frame is called subj.activity.means.

All other intemediate results are deleted from the workspace.