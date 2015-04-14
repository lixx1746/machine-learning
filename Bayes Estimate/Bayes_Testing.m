function error_rates=Bayes_Testing(p1j,p2j,pc1,pc2)
test_data=load('testing_data.txt');
pre=zeros(100,1);
for k=1:numel(pc1)
for i=1:100
x=test_data(i,1:100);
p=sum(x.*log(p1j./p2j)+(1-x).*log((1-p1j)./(1-p2j)))+log(pc1(k)/pc2(k));
if p>=0
    pre(i)=0;
else
    pre(i)=1;
end
end
error_rates(k)=sum(pre-test_data(:,101))/100;
end
