function Task=Sort1(Task)
for i=1:9
    for j=i+1:10
        if(Task(1,i)<Task(1,j))
            temp=Task(:,i);
            Task(:,i)=Task(:,j);
            Task(:,j)=temp;
        end
    end
end
%Ô¼Êø´¦Àí
Task=Constraint(Task);
% index1=find(Task(2,:)==3);
% index2=find(Task(2,:)==5);
% if(index1<index2)
%     temp=Task(:,index2);
%     Task(:,index1+1:index2)=Task(:,index1:index2-1);
%     Task(:,index1)=temp;
% end