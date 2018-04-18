a=randi([1,6],1,40);
b=randi([2,6],1,40).*a;
c=rand(1,40)*0.3;
w=randi([1,15],1,40);
param=[w;a;b;c];