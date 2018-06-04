1 ## Code: run_analysis.R
2
3 ## Downloading of Raw data for analysis
4 library(data.table) 
5 fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' 
6 if (!file.exists('./UCI HAR Dataset.zip'))
7 { download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb') unzip("UCI HAR Dataset.zip", exdir = getwd()) 
8 }
9
10 ## Reading Datasets file-by-file and merging them together into a single    ## Dataset (Data.all) 
11 Subject.Train = read.table('./train/subject_train.txt',header=FALSE) 
12 x.Train = read.table('./train/x_train.txt',header=FALSE) 
13 y.Train = read.table('./train/y_train.txt',header=FALSE) 
14 Subject.Test = read.table('./test/subject_test.txt',header=FALSE) 
15 x.Test = read.table('./test/x_test.txt',header=FALSE) 
16 y.Test = read.table('./test/y_test.txt',header=FALSE)
17
18 x_Dataset <- rbind(x.Train, x.Test) 
19 y_Dataset <- rbind(y.Train, y.Test) 
20 Subject_Dataset <- rbind(Subject.Train, Subject.Test) 
21
22 Data.all <- data.frame(x_Dataset, y_Dataset, Subject_Dataset)
23 dim(Data.all)
24
25 ## Extracts only the measurements on the mean and standard deviation for each ## measurement.
26
27 features <- read.table('./features.txt')
28 mean_std_Data_all <- grep('mean|std', features) 
29 Data_all.sub <- Data.all[,c(1,2,mean_std_Data_all + 2)]
30 ## Uses descriptive activity names to name the activities in the data set
31
32 activity.labels <- read.table('./activity_labels.txt', header = FALSE) 
33 activity.labels[, 2] <- tolower(as.character(activity.labels[,2]))
34 activity.labels[, 2] <- gsub("_", "", activity.labels[, 2])
35 y_Dataset[, 1] = activity.labels[y_Dataset[, 1], 2]
36 colnames(y_Dataset) <- 'activity'
37 colnames(Subject_Dataset) <- 'subject'
38
39 Descr_data <- cbind(Subject_Dataset, Data_all.sub, y_Dataset)
40 write.table(Descr_data, './Assignment/mrgdata.txt', row.names = F)
41
42 ## Tidy data as output as tidy_data.txt file
43
44 Ave_data<-aggregate(. ~subject + activity, Descr_data, mean)
45 Ave_data<-Ave_data[order(Ave_data$subject,Ave_data$activity),]
46
47
48 write.table(Ave_data, file = "tidy_data.txt", row.names = FALSE)


