function [Group,op]=Fitness(Group,Task,opx,opw)
[n,M]=size(opx);
[m,N,P]=size(Group);
costt=[Task(4,:);Task(4,:);Task(4,:);Task(4,:)];
op=zeros(M,2+(N-1)*2,P);
for i=1:P
    for j=1:M
        op(j,:,i)=DP(Group(j,1:N-1,i),Task,opx(j));
    end
    Group(1,N,i)=sum(op(:,1,i))-0.5*max(sum(op(:,2:1+(N-1)*2,i),2))-sum(sum(Group(:,1:N-1,i).*costt,2).*opw');
end

