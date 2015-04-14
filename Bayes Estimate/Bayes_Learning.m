function [p1j p2j pc1 pc2,error_rates]=Bayes_Learning()
trn_data=load('training_data.txt');
val_data=load('validation_data.txt');
trn_label=trn_data(:,101);
%if trn_label==0
a=find(trn_label==0);
b=find(trn_label==1);
num1=numel(a);
num2=800-num1;
trn_class1=trn_data(a,1:100);
trn_class2=trn_data(b,1:100);
p1j=sum(trn_class1,1)/num1;
p2j=sum(trn_class2,1)/num2;
pre=zeros(100,1);
k=1;
for pc1=0.1:0.1:0.9
    pc2=1-pc1;
for i=1:100
x=val_data(i,1:100);
p=sum(x.*log(p1j./p2j)+(1-x).*log((1-p1j)./(1-p2j)))+log(pc1/pc2);
if p>=0
    pre(i)=0;
else
    pre(i)=1;
end
end
error_rates(k)=sum(pre-val_data(:,101))/100;
k=k+1;
end
lo=find(error_rates==min(error_rates));
pc1=0.1.*lo;
pc2=1-pc1;
end


