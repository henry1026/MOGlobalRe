function [Task]=Constraint(Task)
n=size(Task);
i=1;
while(i<=n(2))
    if(Task(7,i)~=0)
        for j=1:n(2)
            if(Task(7,i)==Task(2,j))
                if(i<j)
                    temp=Task(:,j);
                    Task(:,i+1:j)=Task(:,i:j-1);
                    Task(:,i)=temp;
                    i=0;
                    break;
                end
            end
        end
    end
    i=i+1;
end