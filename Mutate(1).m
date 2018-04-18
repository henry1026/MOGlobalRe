function [Group]=Mutate(Group,fmax,fmin,m)
[M,N,P]=size(Group);
for i=1:P
%     if(fmax==fmin)
       mutationRate=0.8;
%     else
%         mutationRate=0.2*((fmax-Group(1,N,i))/(fmax-fmin))^m;
%     end
    if(rand()<mutationRate)
        MutNum=round(rand()*(N-2))+1;
        %MutNum=randint(1,1,[1,N-1]);
        [a,temp]=max(Group(:,MutNum,i));
        excNum=temp+round(rand()*(M-2))+1;
        %excNum=temp+randint(1,1,[1,M-1]);
        if(excNum>M)
            excNum=excNum-M;
        end
        Group(temp,MutNum,i)=0;
        Group(excNum,MutNum,i)=a;
    end
end