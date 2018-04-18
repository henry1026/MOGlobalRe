tic
group=[1 1 1 1 1 1 1 1 1 1];
task=[2 5 7 4 9 3 5 10 13 6;%weight
    1 2 1 3 2 4 1 5 3 6;%a
    5 10 3 9 8 16 6 30 6 12;%b
    0.09 0.21 0.21 0.06 0.03 0.15 0.3 0.09 0.18 0.06%c
    ];
opx=[0.6 0.7 0.8 0.9];
ref=0;
rmx=zeros(4,10);
tmx=zeros(4,10);
for i=1:4
    [returnf]=DP(group,task,opx(i));
    ref=ref+returnf(1);
    tmx(i,:)=returnf(2:11);
    rmx(i,:)=returnf(12:21);
    for j=1:10
        if(returnf(1+j)~=0)
            group(j)=0;
        end
    end
end
toc