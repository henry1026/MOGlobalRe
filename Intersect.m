function [newpop]=Intersect(Group,k)
[M,N,P]=size(Group);
% pc=0.3*exp(1-k/P);
pc=0.7;
for i=1:P
    r1 = rand();  
    Selmother = floor(rand()*(P-1))+1;  %随机选择母亲
    if(r1<pc)
        InterNum = floor(rand()*(N-3)) + 1;     %随机确定交叉点
        newpop(:,InterNum:N,i)=Group(:,InterNum:N,i);
        newpop(:,1:InterNum-1,i)=Group(:,1:InterNum-1,Selmother);
    else
        newpop(:,:,i)=Group(:,:,i);
    end
end