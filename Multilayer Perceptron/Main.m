function Main()
data_trn=load('\data\optdigits_train.txt');
data_val=load('\data\optdigits_valid.txt');
data_test=load('\data\optdigits_test.txt');
n=size(data_trn,1);d=size(data_trn,2);
trn_data=data_trn(1:4:n,1:d-1);trn_labels=data_trn(1:4:n,d);
val_data=data_val(:,1:d-1);val_labels=data_val(:,d);
test_data=data_test(:,1:d-1);test_labels=data_test(:,d);
%train_error=zeros(19,1);val_error=zeros(19,1);test_error=zeros(19,1);i=1;
% for m=2:20
% [train_error(i),val_error(i),v,w,z_val,z_trn]=mlptrain(trn_data,trn_labels,val_data,val_labels,m,d,10,8,2,0);
% [z_test test_error(i)]=mlptest(test_data,test_labels,v,w,m,8,2,0);
% i=i+1;
% end
% %plot(train_error,'r');
% hold on
% plot(val_error);
% hold on
% plot(test_error,'black--');
% legend('tran error','val error','test error');
% xlabel('number of hidden units');
[train_error,val_error,v,w,z_val,z_trn]=mlptrain(trn_data./repmat(sum(trn_data,2),1,64),trn_labels,val_data./repmat(sum(val_data,2),1,64),val_labels,2,d,10,8,2,0);
[z_test test_error]=mlptest(test_data./repmat(sum(test_data,2),1,64),test_labels,v,w,11,8,2,0);
zval=[z_val' val_labels];ztrn=[z_trn' trn_labels];ztest=[z_test' test_labels];
figure(1)
draw(ztrn);
title('train visu');
figure(2)
draw(zval(1:5:n,:));
title('val visu');
figure(3)
draw(ztest);
title('test visu');





function draw(data)
%label 1
for i=1:10
temp=find(data(:,3)==i);n=size(temp,1);
plot(data(temp,1),data(temp,2),'color',[rand rand rand],'line','.','markersize',4);
hold on
str=num2str(data(temp,3));
text(data(temp(1:4:n),1),data(temp(1:4:n),2),str(1:4:n),'fontsize',4.5);
hold on
end








































