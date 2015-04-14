function[train_error,val_error,v,w,z_val z_trn]=mlptrain(train_data,train_labels,val_data,val_labels,m,d,k,c,l,struct)

%   input
%   train_data: a n × d data matrix, train_labels: a n × 1 vector, val_data: a n × d data matrix,
%   val_labels: a n × 1 vector, m: the number of hidden units, d: number of inputs units, 
%   k: number of output units, c: size of image (8 for optdigits data), l: sliding window
%   size (ex: 2, 3, 4, 5), struct: flag indicating to use a structured MLP or not

%   ouput
%   z: a n × m matrix of hidden unit values, v:a k × (m + 1) matrix,
%   w: a m × (d + 1) matrix, train_error: training error rate using tuned epoch length, val_error
epo=450;
if struct==0  % not a struct
learn_rate=0.05;n=size(train_data,1);
trn_labels=train_labels;
trn_data=[ones(n,1) train_data];temp=diag(ones(1,k));
val_data=[ones(size(val_data,1),1) val_data];
w=-0.01+0.02*rand(m,d);v=-0.01+0.02*rand(k,m+1);ep=1;
while(ep<=epo)
for i=1:n
a=-w*trn_data(i,:)';
z=1./(1+exp(a));
o=v*[ones(1);z];
y=exp(o)./sum(exp(o));
update_v=learn_rate.*(repmat([ones(1);z],1,k)*diag(temp(trn_labels(i)+1,:)'-y));
update_w=learn_rate.*repmat(trn_data(i,:)',1,m)*diag((temp(trn_labels(i)+1,:)'-y)'*v(:,2:m+1).*z'.*(1-z'));
v=v+update_v';
w=w+update_w';
end
ep=ep+1;
end
val_error=pre(w,v,val_data,val_labels,k,size(val_data,1)) ;
train_error=pre(w,v,trn_data,trn_labels,k,n);
a3=-w*trn_data';a4=-w*val_data';
z_trn=1./(1+exp(a3)); z_val=1./(1+exp(a4));
else
    %struct 
    
    
end









function error=pre(w,v,data,labels,k,n)
a1=-w*data';
z1=1./(1+exp(a1));
o1=v*[ones(1,n);z1];
y1=exp(o1)./repmat(sum(exp(o1),1),k,1);
[max1 index1]=max(y1);
error=size(find(index1-1-labels'),2)./n;