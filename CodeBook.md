DATA

subject
    number of a subject, 1-30
    
activity

    type of activity performed while gathering data
    
    fairly straightforward
    
      1 WALKING
    
      2 WALKING_UPSTAIRS
    
      3 WALKING_DOWNSTAIRS

      4 SITTING

      5 STANDING

      6 LAYING
    
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


  tBodyAcc-XYZ

  tGravityAcc-XYZ

  tBodyAccJerk-XYZ

  tBodyGyro-XYZ

  tBodyGyroJerk-XYZ

  tBodyAccMag

  tGravityAccMag

  tBodyAccJerkMag

  tBodyGyroMag

  tBodyGyroJerkMag

  fBodyAcc-XYZ

  fBodyAccJerk-XYZ

  fBodyGyro-XYZ

  fBodyAccMag

  fBodyAccJerkMag

  fBodyGyroMag

  fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 

  mean..: Mean value

  std..: Standard deviation


In final dataset all above listed features denote mean value for each category




Now, for the shenanigans

All data is gathered via read.table() first: subject numbers, activities info, data itself and vector disambiguation.

Then for test and train separately all these rows are assembled, creating two full datasets with subjects, activities and measurements as columns.

From there only columns with str() and mean() on the end are selected in a hideous manner, procedure applied to both sets, then stiching them together into a superset; numbers for modes of operation are subsequently replaced with proper names.

Then this superset is melted, with subjects and activities as ids and all other columns as values. It is then cast into two sets, calculating average across variables, then two are stitched together, and an odd column 8 is removed.

It goes to the output, and there you have it.
