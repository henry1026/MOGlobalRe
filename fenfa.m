clc;
clear;

N=10;%任务数量
M=1;
%Task=zeros(7,N);
% Task=[2 5 7 4 9 3 5 10 13 6;%weight
%     1 2 1 3 2 4 1 5 3 6;%a
%     5 10 3 9 8 16 6 30 6 12;%b
%     0.09 0.21 0.21 0.06 0.03 0.15 0.3 0.09 0.18 0.06%c
%     ];
Task1=[13,2,5,4,5,8,6,2,14,7,14,6,6,10,4;
    2,1,4,3,4,1,5,5,1,2,5,6,3,4,2;
    10,5,24,15,8,4,30,20,6,10,20,36,6,8,4;
    0.137123901324210,0.0175850234148390,0.226230189310063,0.227026951763280,0.0847173821987125,0.173244500231301,0.198209665501887,0.0383368930465437,0.232914930366019,0.00262578135561735,0.244691650475203,0.178775023412996,0.294939716396849,0.0643927958463817,0.131855590290971];

for i= 10:20
    Task=Task1(:,1:i);
    for j=1:10
        tic
        %Task=sortrows(Task',-1)';%按权值从大到小排序
        opx=[0.6 0.8 0.9 0.7];
        opw=[0 0 0 0];
        [ReOps,Result]=Allocate(Task,opx,opw);
        %plot(Result);
        tim(i-9,j)=toc;
    end
end