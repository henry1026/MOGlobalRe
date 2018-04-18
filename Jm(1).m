function [returnf]=Jm(group,task,tmx,rmx,opx)
[m n1]=size(task);
ftmx=zeros(1,n1);
frmx=zeros(1,n1);
m=0;
for i=1:n1
    if(group(i,:)==1)
        m=m+1;
        t(:,m)=task(:,i); 
        %t(4,m)=sum(task(4,i:n1));
    end
end
for i=1:m
    a=t(2,i);
    b=t(3,i);
    c=sum(t(4,i:m));
    w=t(1,i);
    fy=w./(1+exp(-a*tc+b))-c*(tc+rc)-r*(tc+rc);
end