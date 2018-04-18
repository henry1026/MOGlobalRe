tic
task=[2 5 7 4 9 3 5 10 13 6;%weight
    1 2 1 3 2 4 1 5 3 6;%a
    5 10 3 9 8 16 6 30 6 12;%b
    0.09 0.21 0.21 0.06 0.03 0.15 0.3 0.09 0.18 0.06%c
    ];
opx=[0.6 0.8 0.9 0.7];
Group=zeros(4,10);
retmx=zeros(4,10);
rermx=zeros(4,10);
ref=0;
for i=1:10
    for j=1:4
        for k=0:20
            x1=0.5+k*0.02;%sum(task(4,i:10))/4
            [ymx1(k+1),tmx1(k+1),rmx1(k+1)]=fmax(task(2,i),task(3,i),sum(task(4,i:10))*opx(j)/sum(opx),task(1,i),opx(j),x1);
        end
        [f(j),index1]=max(ymx1);
        tmx(j)=tmx1(index1);
        rmx(j)=rmx1(index1);
    end
    [tempj,index]=max(f);
    if(tempj>0)
        Group(index,i)=1;
        retmx(index,i)=tmx(index);
        rermx(index,i)=rmx(index);
        opx(index)=0.5+(index1-1)*0.02;
        ref=ref+tempj;
    end
end
toc