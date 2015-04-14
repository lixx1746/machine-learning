function [w,w0,fval,Xi] = SVM_w(data,labels,C)
n = length(labels);
Xi=zeros(1,n);
H = (labels*labels').*(data*data');
f = -ones(1,n);
A = [];
b = [];
Aeq = labels'; 
beq = 0;
lb = zeros(n,1);
ub = C;
a0 = zeros(n,1);  
options=optimset;    
options.LargeScale = 'off';
options.Display = 'off';
options.Algorithm='active-set';
[a,fval,eXitflag,output,lambda]  = quadprog(H,f,A,b,Aeq,beq,lb,ub,a0,options); 
temp2=a.*labels;
temp1=data'*diag(a.*labels);
w=sum(data'*diag(a.*labels),2);
w0=mean(labels'-w'*data');
temp=w'*data'+w0;
Xi(labels'.*temp>=1)=0;
Xi(labels'.*temp>=0&labels'.*temp<1)=1-abs(temp(labels'.*temp>=0&labels'.*temp<1));
Xi(labels'.*temp<0)=1+abs(temp(labels'.*temp<0));
Xi=1-(w'*data'+w0);
end