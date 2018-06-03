C:\Users\Pandu\Desktop\Pandu_ course\CASE_STUDY\KNN_Class_cancer_ramesh

#Packages
install.packages("class")#knn classifier
install.packages("gmodels")
library(class)
library(gmodels)#CrossTable


#1)Data setup
wbcd=read.table(file="C:/Users/Pandu/Desktop/Pandu_ course/CASE_STUDY/KNN_Class_cancer_ramesh/wisc_bc_data-KNN.csv",header=T,sep=",")
wbcd=wbcd[,-1]
table(wbcd$diagnosis)
wbcd$diagnosis=factor(wbcd$diagnosis,levels=c("B","M"),labels=c("Benign","Malignant"))

#2)Normalize the data
normalize=function(x){
return((x-min(x))/(max(x)-min(x)))
}
wbcd_n=as.data.frame(apply(wbcd[,2:31],MARGIN=2,normalize))

#3) Creation of train data and test data.
wbcd_train=wbcd_n[1:469,]
wbcd_test=wbcd_n[470:569,]
wbcd_train_labels=wbcd[1:469,1]
wbcd_test_labels=wbcd[470:569,1]

#4)Building the classifier
wbcd_pred=knn(train=wbcd_train,test=wbcd_test,cl=wbcd_train_labels,k=21)

#5) Performance testing
Performance=CrossTable(wbcd_test_labels,wbcd_pred,prop.t=F,prop.c=F,prop.r=T,prop.chisq=F,dnn=c("Actual","Predict"))
Accuracy=(Performance$t[1,1]+Performance$t[2,2])/length(wbcd_test_labels)
Accuracy