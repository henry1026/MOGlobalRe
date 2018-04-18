function [Group]=Initial(M,N,P)
Group=zeros(M,N,P);
for i=1:P
    pop=round(rand(M,N-1));
    for j=1:N-1
        Group(round(rand()*(M-1))+1,j,i)=1;
    end
end