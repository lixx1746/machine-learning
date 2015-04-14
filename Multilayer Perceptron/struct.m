function struct(data,label,c,l,k)
data_trn=load('\data\optdigits_train.txt');
d=size(data_trn,2);n=size(data_trn,1);c=8;l=2;k=10;
trn_data=data_trn(1:15:n,1:d-1);trn_labels=data_trn(1:15:n,d);n1=size(trn_data,1);
trn_data=reshape(trn_data',c,c,n1);dataset=zeros(l,l,(c-l+1)^2);q=1;
temp=diag(ones(1,k));
%# of hidden unit is (c-l+1)^2, every hidden unit has l*l input
w=-0.01+0.02*rand((c-l+1).^2,l*l+1);
v=-0.01+0.02*rand(k,(c-l+1)^2+1);
for i=1:n1
    data=trn_data(:,:,m);
for p=1:c-l+1
    for j=1:c-l+1
    dataset(:,:,q)=data(p:p+l-1,j:j+l-1);
    q=q+1;
    end
end
new_data=[ones(1,(c-l+1)^2) ;reshape(dataset,l*l,(c-l+1)^2)];
a=-diag(w*new_data);
z=1./(1+exp(a));
o=v*[ones(1);z];
y=exp(o)./sum(exp(o));
update_v=learn_rate.*(repmat([ones(1);z],1,k)*diag(temp(trn_labels(i)+1,:)'-y));
update_w=learn_rate.*repmat(trn_data(i,:)',1,m)*diag((temp(trn_labels(i)+1,:)'-y)'*v(:,2:m+1).*z'.*(1-z'));
end
