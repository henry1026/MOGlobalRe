function [returnf]=DP(group,task,opx)
[m n1]=size(task);
ftmx=zeros(1,n1);
frmx=zeros(1,n1);
m=0;
for i=1:n1
    if(group(i)==1)
        m=m+1;
        t(:,m)=task(:,i); 
        %t(4,m)=sum(task(4,i:n1));
    end
end
n=m+1;
f=zeros(n,42);
tmx=zeros(n,42);
rmx=zeros(n,42);
indexmx=zeros(n,42);
findex1=zeros(1,n);
ftmx1=zeros(1,n);
frmx1=zeros(1,n);

for i=n-1:-1:1
    tpara(1)=t(1,i);
    tpara(2)=t(2,i);
    tpara(3)=t(3,i);
    %tpara(4)=0;
    tpara(4)=sum(t(4,i:n-1));
    [f(i,:),tmx(i,:),rmx(i,:),indexmx(i,:)]=stagel(f(i+1,:),tpara);
end
j=(opx-0.5)/0.02+1;
k=round(j);
fchoice=[f(1,k),f(1,k+21)];
[final,i]=max(fchoice);
findex1(1)=k+(i-1)*21;
for i=1:n-1
    findex1(i+1)=indexmx(i,findex1(i));
    ftmx1(i)=tmx(i,findex1(i));
    frmx1(i)=rmx(i,findex1(i));
    
end
if(findex1(n)<22)
    opx=0.5+(findex1(n)-1)*0.02;
else
    opx=0.5+(findex1(n)-22)*0.02;
end
j=0;
for i=1:n1
    if(group(i)==1)
        j=j+1;
        ftmx(i)=ftmx1(j);
        frmx(i)=frmx1(j); 
    end
end
returnf=[final,ftmx,frmx,opx];