function [r,u,Q]=EMG()
k=5;
data=imread('image_small.bmp');
data=im2double(data);
a=size(data,1);b=size(data,2);
x=reshape(data,a*b,3)';
N=size(x,2);
u=repmat((1:k)./k,3,1).*ones(3,k);s=repmat(diag([1,1,1]),[1,1,k]);p=ones(k,1)./k;
r=zeros(k,N);
likechange=1;m=1;
while(1)
like=0;
for i=1:k   %E-step begin
  X_shift=x-repmat(u(:,i),1,N);
  temp= sum(X_shift'*pinv(s(:,:,i)).*X_shift',2);
  r(i,:)=p(i)*(det(s(:,:,i)).^-0.5).*exp(-0.5.*temp');
end
regu=sum(r,1);
for i=1:k
r(i,:)=r(i,:)./regu;
end  %E-step end,M-step begin
Nk=sum(r,2);
u=(diag(1./Nk)*r*x')';

for i=1:k
    X_shift=x-repmat(u(:,i),1,N);
    y1=X_shift*diag(r(1,:));
    s(:,:,i)=X_shift*diag(r(i,:))*(X_shift');
    s(:,:,i)=s(:,:,i)./Nk(i);
end
p=Nk./N;  %M-step end
for n=1:N
    b=0;
    for i=1:k
     b=p(i).*mvnpdf(x(:,n),u(:,i),s(:,:,i))+b;
    end
    like=log(b)+like;
end
like_hood(m)=like;
if m>=2
likechange=(like_hood(m)-like_hood(m-1))/(like_hood(m-1));
else
end
m=m+1;
if abs(likechange)<=0.01 
    Q=like_hood;
    return
end
end




