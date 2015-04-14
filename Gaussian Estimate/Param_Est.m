function [m1 m2 s1_a s1_b s1_c s2_a s2_b s2_c]=Param_Est()
trn_data=load('training_data.txt');
class1_data=trn_data(find(trn_data(:,9)==1),:);
class2_data=trn_data(find(trn_data(:,9)==2),:);
num1=size(class1_data,1);
num2=size(class2_data,1);
pc1=num1/size(trn_data,1);
pc2=num2/size(trn_data,1);
m1=(sum(class1_data(1:8),1)/num1)';
m2=(sum(class2_data(1:8),1)/num2)';
difcov1=zeros(8,8);
difcov2=zeros(8,8);

for i=1:num1
    difcov1=((class1_data(i,1:8))'-m1)*(((class1_data(i,1:8))'-m1)')+difcov1;
end  
for i=1:num2
    difcov2=((class2_data(i,1:8))'-m2)*(((class2_data(i,1:8))'-m2)')+difcov2;
end
s1_c=difcov1/num1;
s2_c=difcov2/num2;
s1_b=pc1.*s1_c+pc2.*s2_c;
s2_b=s1_b;
s1_a=diag(diag(s1_c));
s2_a=diag(diag(s2_c));






