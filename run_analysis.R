library(reshape2)



names_test<-tolower(read.table('./features.txt')[,2])#names for values in vector
propernames <- read.table('./activity_labels.txt')

y_test<-read.table('./test/y_test.txt',col.names='activity')
subject_test<-read.table('./test/subject_test.txt',col.names='subject')
X_test<-read.table('./test/X_test.txt',col.names=names_test)

X_final_test<-X_test[,c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,
                   266,267,268,345,346,347,424,425,426,503,516,529,542,
                   4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,
                   269,270,271,348,349,350,427,428,429,504,517,530,543)]
#dumb list of all values ending with std() or mean()
X_final_test<-cbind(subject_test,y_test,X_final_test)

#================================================================

y_train<-read.table('./train/y_train.txt',col.names='activity')
subject_train<-read.table('./train/subject_train.txt',col.names='subject')
X_train<-read.table('./train/X_train.txt',col.names=names_test)

X_final_train<-X_train[,c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,
                        266,267,268,345,346,347,424,425,426,503,516,529,542,
                        4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,
                        269,270,271,348,349,350,427,428,429,504,517,530,543)]
X_final_train<-cbind(subject_train,y_train,X_final_train)

Fin<-rbind(X_final_train,X_final_test)

Fin$activity[Fin$activity==1]<-'WALKING'
Fin$activity[Fin$activity==2]<-'WALKING_UPSTAIRS'
Fin$activity[Fin$activity==3]<-'WALKING_DOWNSTAIRS'
Fin$activity[Fin$activity==4]<-'SITTING'
Fin$activity[Fin$activity==5]<-'STANDING'
Fin$activity[Fin$activity==6]<-'LAYING'

Gmelt<- melt(Fin, id=c('activity','subject'),measure.vars=c(3:68))

Gout<-dcast(Gmelt,variable ~ activity,mean)
Gout2<-dcast(Gmelt,variable ~subject,mean)
theend<-cbind(Gout,Gout2)
theend[,8]<-NULL
write.table(theend,'./theend.txt',row.name=FALSE)
