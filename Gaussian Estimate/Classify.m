function [pre_a_trn pre_a_test pre_b_trn pre_b_test pre_c_trn pre_c_test]=Classify(m1,m2,s1_a,s1_b,s1_c,s2_a,s2_b,s2_c)
trn_data=load('training_data.txt');
test_data=load('test_data.txt');
pc1=0.3;
pc2=0.7;
pre_a_trn=ones(size(trn_data,1),1);
pre_a_test=ones(size(test_data,1),1);
pre_b_trn=ones(size(trn_data,1),1);
pre_b_test=ones(size(test_data,1),1);
pre_c_trn=ones(size(trn_data,1),1);
pre_c_test=ones(size(test_data,1),1);

for i=1:size(trn_data,1)
if g(s1_a,(trn_data(i,1:8))',m1,pc1)<g(s2_a,(trn_data(i,1:8))',m2,pc2);
    pre_a_trn(i)=2;
end
end
    
for i=1:size(test_data,1)
if g(s1_a,(test_data(i,1:8))',m1,pc1)<g(s2_a,(test_data(i,1:8))',m2,pc2);
    pre_a_test(i)=2;
end
end

for i=1:size(trn_data,1)
if g(s1_b,(trn_data(i,1:8))',m1,pc1)<g(s2_b,(trn_data(i,1:8))',m2,pc2);
    pre_b_trn(i)=2;
end
end
    
for i=1:size(test_data,1)
if g(s1_b,(test_data(i,1:8))',m1,pc1)<g(s2_b,(test_data(i,1:8))',m2,pc2);
    pre_b_test(i)=2;
end
end

for i=1:size(trn_data,1)
if g(s1_c,(trn_data(i,1:8))',m1,pc1)<g(s2_c,(trn_data(i,1:8))',m2,pc2);
    pre_c_trn(i)=2;
end
end
    
for i=1:size(test_data,1)
if g(s1_c,(test_data(i,1:8))',m1,pc1)<g(s2_c,(test_data(i,1:8))',m2,pc2);
    pre_c_test(i)=2;
end
end


function g=g(s,x,m,p)
g=-1/2.*log(det(s))-1/2.*((x-m)')*(s\(x-m))+log(p);
return

