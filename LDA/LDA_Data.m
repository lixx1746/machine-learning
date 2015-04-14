function LDA_Data()
data_set=load('optdigits.tes');
dig0=data_set(find(data_set(:,65)==0),1:64);dig1=data_set(find(data_set(:,65)==1),1:64);dig2=data_set(find(data_set(:,65)==2),1:64);dig3=data_set(find(data_set(:,65)==3),1:64);
dig4=data_set(find(data_set(:,65)==4),1:64);dig5=data_set(find(data_set(:,65)==5),1:64);dig6=data_set(find(data_set(:,65)==6),1:64);dig7=data_set(find(data_set(:,65)==7),1:64);
dig8=data_set(find(data_set(:,65)==8),1:64);dig9=data_set(find(data_set(:,65)==9),1:64);
m0=sum(dig0,1)/size(dig0,1);m1=sum(dig1,1)/size(dig1,1);m2=sum(dig2,1)/size(dig2,1);m3=sum(dig3,1)/size(dig3,1);m4=sum(dig4,1)/size(dig4,1);m5=sum(dig5,1)/size(dig5,1);
m6=sum(dig6,1)/size(dig6,1);m7=sum(dig7,1)/size(dig7,1);m8=sum(dig8,1)/size(dig8,1);m9=sum(dig9,1)/size(dig9,1);
s0=zeros(size(dig0,2),size(dig0,2));s1=zeros(size(dig1,2),size(dig1,2));s2=zeros(size(dig2,2),size(dig2,2));
s3=zeros(size(dig3,2),size(dig3,2));s4=zeros(size(dig4,2),size(dig4,2));s5=zeros(size(dig5,2),size(dig5,2));
s6=zeros(size(dig6,2),size(dig6,2));s7=zeros(size(dig7,2),size(dig7,2));s8=zeros(size(dig8,2),size(dig8,2));s9=zeros(size(dig9,2),size(dig9,2));
for i=1:size(dig0,1)
s0=(dig0(i,:)'-m0')*((dig0(i,:)'-m0')')+s0;
end
for i=1:size(dig1,1)
s1=(dig1(i,:)'-m1')*((dig1(i,:)'-m1')')+s1;
end
for i=1:size(dig2,1)
s2=(dig2(i,:)'-m2')*((dig2(i,:)'-m2')')+s2;
end
for i=1:size(dig3,1)
s3=(dig3(i,:)'-m3')*((dig3(i,:)'-m3')')+s3;
end
for i=1:size(dig4,1)
s4=(dig4(i,:)'-m4')*((dig4(i,:)'-m4')')+s4;
end
for i=1:size(dig5,1)
s5=(dig5(i,:)'-m5')*((dig5(i,:)'-m5')')+s5;
end
for i=1:size(dig6,1)
s6=(dig6(i,:)'-m6')*((dig6(i,:)'-m6')')+s6;
end
for i=1:size(dig7,1)
s7=(dig7(i,:)'-m7')*((dig7(i,:)'-m7')')+s7;
end
for i=1:size(dig8,1)
s8=(dig8(i,:)'-m8')*((dig8(i,:)'-m8')')+s8;
end
for i=1:size(dig9,1)
s9=(dig9(i,:)'-m9')*((dig9(i,:)'-m9')')+s9;
end
Sw=s0+s1+s2+s3+s4+s5+s6+s7+s8+s9+0.001;
m=(m0+m1+m2+m3+m4+m5+m6+m7+m8+m9)/10;
n=[size(dig0,1),size(dig1,1),size(dig2,1),size(dig3,1),size(dig4,1),size(dig5,1),size(dig6,1),size(dig7,1),size(dig8,1),size(dig9,1)];
m_index=[m0,m1,m2,m3,m4,m5,m6,m7,m8,m9];
Sb=zeros(size(m1,2),size(m1,2));
for i=1:10
    Sb=n(i).*((m_index(i)'-m')*(m_index(i)'-m')')+Sb;
end
b=pinv(Sw);
a=b*Sb;
[u,d0]=eigs(a);
dpro2_0=u(:,1:2)'*dig0';dpro2_1=u(:,1:2)'*dig1';dpro2_2=u(:,1:2)'*dig2';dpro2_3=u(:,1:2)'*dig3';dpro2_4=u(:,1:2)'*dig4';dpro2_5=u(:,1:2)'*dig5';
dpro2_6=u(:,1:2)'*dig6';dpro2_7=u(:,1:2)'*dig7';dpro2_8=u(:,1:2)'*dig8';dpro2_9=u(:,1:2)'*dig9';
dpro3_0=u(:,1:3)'*dig0';dpro3_1=u(:,1:3)'*dig1';dpro3_2=u(:,1:3)'*dig2';dpro3_3=u(:,1:3)'*dig3';dpro3_4=u(:,1:3)'*dig4';dpro3_5=u(:,1:3)'*dig5';
dpro3_6=u(:,1:3)'*dig6';dpro3_7=u(:,1:3)'*dig7';dpro3_8=u(:,1:3)'*dig8';dpro3_9=u(:,1:3)'*dig9';
figure(1)

text(dpro2_0(1,:),dpro2_0(2,:),'0','fontsize',5,'color',[0 0 0]);text(dpro2_1(1,:),dpro2_1(2,:),'1','fontsize',5,'color',[0 0 1]);text(dpro2_2(1,:),dpro2_2(2,:),'2','fontsize',5,'color',[0 1 0]);text(dpro2_3(1,:),dpro2_3(2,:),'3','fontsize',5,'color',[0 1 1]);text(dpro2_4(1,:),dpro2_4(2,:),'4','fontsize',5,'color',[1 0 0]);
text(dpro2_5(1,:),dpro2_5(2,:),'5','fontsize',5,'color',[1 0 1]);text(dpro2_6(1,:),dpro2_6(2,:),'6','fontsize',5,'color',[1 0.5 0.5]);text(dpro2_7(1,:),dpro2_7(2,:),'7','fontsize',5,'color',[1 1 1]);text(dpro2_8(1,:),dpro2_8(2,:),'8','fontsize',5,'color',[0.5 0.5 0.5]);text(dpro2_9(1,:),dpro2_9(2,:),'9','fontsize',5,'color',[0 0.5 0.5]);
axis([-10 20 3 10]);
figure(2)

text(dpro3_0(1,:),dpro3_0(2,:),dpro3_0(3,:),'0','fontsize',5,'color',[0 0 0]);text(dpro3_1(1,:),dpro3_1(2,:),dpro3_1(3,:),'1','fontsize',5,'color',[0 0 1]);
text(dpro3_2(1,:),dpro3_2(2,:),dpro3_2(3,:),'2','fontsize',5,'color',[0 1 0]);text(dpro3_3(1,:),dpro3_3(2,:),dpro3_3(3,:),'3','fontsize',5,'color',[0 1 1]);
text(dpro3_4(1,:),dpro3_4(2,:),dpro3_4(3,:),'4','fontsize',5,'color',[1 0 0]);text(dpro3_5(1,:),dpro3_5(2,:),dpro3_5(3,:),'5','fontsize',5,'color',[1 0 1]);
text(dpro3_6(1,:),dpro3_6(2,:),dpro3_6(3,:),'6','fontsize',5,'color',[1 1 0]);text(dpro3_7(1,:),dpro3_7(2,:),dpro3_7(3,:),'7','fontsize',5,'color',[1 1 1]);
text(dpro3_8(1,:),dpro3_8(2,:),dpro3_8(3,:),'8','fontsize',5,'color',[0.5 0.5 0.5]);text(dpro3_9(1,:),dpro3_9(2,:),dpro3_9(3,:),'9','fontsize',5,'color',[0.5 1 0]);
axis([-1 1 3 10 -2 5]);

end

