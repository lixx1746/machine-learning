function PCA_Data()
data_set=load('optdigits.tes');
dig0=data_set(find(data_set(:,65)==0),1:64);dig1=data_set(find(data_set(:,65)==1),1:64);dig2=data_set(find(data_set(:,65)==2),1:64);dig3=data_set(find(data_set(:,65)==3),1:64);
dig4=data_set(find(data_set(:,65)==4),1:64);dig5=data_set(find(data_set(:,65)==5),1:64);dig6=data_set(find(data_set(:,65)==6),1:64);dig7=data_set(find(data_set(:,65)==7),1:64);
dig8=data_set(find(data_set(:,65)==8),1:64);dig9=data_set(find(data_set(:,65)==9),1:64);
m_d0=sum(dig0,1)/size(dig0,1);m_d1=sum(dig1,1)/size(dig1,1);m_d2=sum(dig2,1)/size(dig2,1);m_d3=sum(dig3,1)/size(dig3,1);m_d4=sum(dig4,1)/size(dig4,1);m_d5=sum(dig5,1)/size(dig5,1);
m_d6=sum(dig6,1)/size(dig6,1);m_d7=sum(dig7,1)/size(dig7,1);m_d8=sum(dig8,1)/size(dig8,1);m_d9=sum(dig9,1)/size(dig9,1);
s0=zeros(size(dig0,2),size(dig0,2));s1=zeros(size(dig1,2),size(dig1,2));s2=zeros(size(dig2,2),size(dig2,2));
s3=zeros(size(dig3,2),size(dig3,2));s4=zeros(size(dig4,2),size(dig4,2));s5=zeros(size(dig5,2),size(dig5,2));
s6=zeros(size(dig6,2),size(dig6,2));s7=zeros(size(dig7,2),size(dig7,2));s8=zeros(size(dig8,2),size(dig8,2));s9=zeros(size(dig9,2),size(dig9,2));
for i=1:size(dig0,1)
s0=(dig0(i,:)'-m_d0')*((dig0(i,:)'-m_d0')')+s0;
end
s0=s0/size(dig0,1);for i=1:size(dig1,1)
s1=(dig1(i,:)'-m_d1')*((dig1(i,:)'-m_d1')')+s1;
end
s1=s1/size(dig1,1);for i=1:size(dig2,1)
s2=(dig2(i,:)'-m_d2')*((dig2(i,:)'-m_d2')')+s2;
end
s2=s2/size(dig2,1);for i=1:size(dig3,1)
s3=(dig3(i,:)'-m_d3')*((dig3(i,:)'-m_d3')')+s3;
end
s3=s3/size(dig3,1);for i=1:size(dig4,1)
s4=(dig4(i,:)'-m_d4')*((dig4(i,:)'-m_d4')')+s4;
end
s4=s4/size(dig4,1);for i=1:size(dig5,1)
s5=(dig5(i,:)'-m_d5')*((dig5(i,:)'-m_d5')')+s5;
end
s5=s5/size(dig5,1);for i=1:size(dig6,1)
s6=(dig6(i,:)'-m_d6')*((dig6(i,:)'-m_d6')')+s6;
end
s6=s6/size(dig6,1);for i=1:size(dig7,1)
s7=(dig7(i,:)'-m_d7')*((dig7(i,:)'-m_d7')')+s7;
end
s7=s7/size(dig7,1);for i=1:size(dig8,1)
s8=(dig8(i,:)'-m_d8')*((dig8(i,:)'-m_d8')')+s8;
end
s8=s8/size(dig8,1);for i=1:size(dig9,1)
s9=(dig9(i,:)'-m_d9')*((dig9(i,:)'-m_d9')')+s9;
end
s9=s9/size(dig9,1);
[u0,d0]=eigs(s0);[u1,d1]=eigs(s1);[u2,d2]=eigs(s2);[u3,d3]=eigs(s3);[u4,d4]=eigs(s4);[u5,d5]=eigs(s5);[u6,d6]=eigs(s6);[u7,d7]=eigs(s7);[u8,d8]=eigs(s8);[u9,d9]=eigs(s9);
dpro2_0=u0(:,1:2)'*(dig0- repmat(m_d0,size(dig0,1),1))';dpro2_1=u1(:,1:2)'*(dig1-repmat(m_d1,size(dig1,1),1))';dpro2_2=u2(:,1:2)'*(dig2-repmat(m_d2,size(dig2,1),1))';dpro2_3=u3(:,1:2)'*(dig3-repmat(m_d3,size(dig3,1),1))';dpro2_4=u4(:,1:2)'*(dig4-repmat(m_d4,size(dig4,1),1))';dpro2_5=u5(:,1:2)'*(dig5-repmat(m_d5,size(dig5,1),1))';
dpro2_6=u6(:,1:2)'*(dig6-repmat(m_d6,size(dig6,1),1))';dpro2_7=u7(:,1:2)'*(dig7-repmat(m_d7,size(dig7,1),1))';dpro2_8=u8(:,1:2)'*(dig8-repmat(m_d8,size(dig8,1),1))';dpro2_9=u9(:,1:2)'*(dig9-repmat(m_d9,size(dig9,1),1))';
dpro3_0=u0(:,1:3)'*(dig0- repmat(m_d0,size(dig0,1),1))';dpro3_1=u1(:,1:3)'*(dig1-repmat(m_d1,size(dig1,1),1))';dpro3_2=u2(:,1:3)'*(dig2-repmat(m_d2,size(dig2,1),1))';dpro3_3=u3(:,1:3)'*(dig3-repmat(m_d3,size(dig3,1),1))';dpro3_4=u4(:,1:3)'*(dig4-repmat(m_d4,size(dig4,1),1))';dpro3_5=u5(:,1:3)'*(dig5-repmat(m_d5,size(dig5,1),1))';
dpro3_6=u6(:,1:3)'*(dig6-repmat(m_d6,size(dig6,1),1))';dpro3_7=u7(:,1:3)'*(dig7-repmat(m_d7,size(dig7,1),1))';dpro3_8=u8(:,1:3)'*(dig8-repmat(m_d8,size(dig8,1),1))';dpro3_9=u9(:,1:3)'*(dig9-repmat(m_d9,size(dig9,1),1))';
figure(1)
text(dpro2_0(1,:),dpro2_0(2,:),'0','fontsize',5,'color',[0 0 0]);text(dpro2_1(1,:),dpro2_1(2,:),'1','fontsize',5,'color',[0 0 1]);text(dpro2_2(1,:),dpro2_2(2,:),'2','fontsize',5,'color',[0 1 0]);text(dpro2_3(1,:),dpro2_3(2,:),'3','fontsize',5,'color',[0 1 1]);text(dpro2_4(1,:),dpro2_4(2,:),'4','fontsize',5,'color',[1 0 0]);
text(dpro2_5(1,:),dpro2_5(2,:),'5','fontsize',5,'color',[1 0 1]);text(dpro2_6(1,:),dpro2_6(2,:),'6','fontsize',5,'color',[1 0.5 0.5]);text(dpro2_7(1,:),dpro2_7(2,:),'7','fontsize',5,'color',[1 1 1]);text(dpro2_8(1,:),dpro2_8(2,:),'8','fontsize',5,'color',[0.5 0.5 0.5]);text(dpro2_9(1,:),dpro2_9(2,:),'9','fontsize',5,'color',[0 0.5 0.5]);
axis([-50 40 -40 40]);
figure(2)
text(dpro3_0(1,:),dpro3_0(2,:),dpro3_0(3,:),'0','fontsize',5,'color',[0 0 0]);text(dpro3_1(1,:),dpro3_1(2,:),dpro3_1(3,:),'1','fontsize',5,'color',[0 0 1]);
text(dpro3_2(1,:),dpro3_2(2,:),dpro3_2(3,:),'2','fontsize',5,'color',[0 1 0]);text(dpro3_3(1,:),dpro3_3(2,:),dpro3_3(3,:),'3','fontsize',5,'color',[0 1 1]);
text(dpro3_4(1,:),dpro3_4(2,:),dpro3_4(3,:),'4','fontsize',5,'color',[1 0 0]);text(dpro3_5(1,:),dpro3_5(2,:),dpro3_5(3,:),'5','fontsize',5,'color',[1 0 1]);
text(dpro3_6(1,:),dpro3_6(2,:),dpro3_6(3,:),'6','fontsize',5,'color',[1 1 0]);text(dpro3_7(1,:),dpro3_7(2,:),dpro3_7(3,:),'7','fontsize',5,'color',[1 1 1]);
text(dpro3_8(1,:),dpro3_8(2,:),dpro3_8(3,:),'8','fontsize',5,'color',[0.5 0.5 0.5]);text(dpro3_9(1,:),dpro3_9(2,:),dpro3_9(3,:),'9','fontsize',5,'color',[0.5 1 0]);
axis([-80 40 -60 40 -25 25]);
end
