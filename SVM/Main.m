function error=hw5_Q2()
trn_data1=load('train1.txt');
trn_data2=load('train2.txt');
test_data1=load('test.txt');
trn_data=[trn_data1(:,2:14) ; trn_data2(:,2:14)];
trn_labels=[trn_data1(:,1) ; trn_data2(:,1)];
test_data=test_data1(:,2:14);test_labels=test_data1(:,1);error=zeros(1,6);
trn_labels(trn_labels==2)=-1;
test_labels(test_labels==2)=-1;
n1=size(test_labels,1);
C1=[0.1 1 10 100 1000 10000];C2=10;
for i=1:6
C=[repmat(C1(i),size(trn_data1(:,1)),1) ;repmat(C2,size(trn_data2(:,1)),1)];
[w,w0,fval,Xi] = SVM_w(trn_data,trn_labels,C);

pre_test=sign((w'*test_data'+w0));
m=pre_test-test_labels';
temp=size(find(pre_test-test_labels'),2);
error(i)=temp./n1;
end
