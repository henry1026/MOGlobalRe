function c=Conn(Group)
[M,N,P]=size(Group);
for i=1:P
    for j=1:P
        dij=sum(sum(abs(Group(:,1:N-1,i)-Group(:,1:N-1,j))))/(N-1);%≈∑¿≠æ‡¿Î
        if dij<0.2 % && abs(A(i)-A(j))<1
            Nr(i,j)=1;
        else
            Nr(i,j)=0;
        end
    end
    c(i)=sum(Nr(i,:));%√‹∂»
end