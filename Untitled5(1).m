a=randi([1,6],1,40);
b=randi([2,6],1,40).*a;
c=rand(1,40)*0.3;
w=randi([1,15],1,40);
param=[w;a;b;c];
lamata=1;
st=1;
et=10;
opx=[0.6 0.8 0.9 0.7];
quitflag=0;
sumf=0;
%�������Ա�Ĺ���ʱ���ͻر�
reops=zeros(4,80);
optask=zeros(4,40);%���������
opleft=zeros(4,40);%����ʣ��ʱ��
opf=zeros(4,40);%����ر�
for ii=1:10%���Ĳ���ÿ��10������
    if(et>=40)
        et=40;
        quitflag=1;
    end
    task=param(:,st:et);
    %opx=opxs(:,st);%��һ�׶β���Ա������
    opw=sum(opleft,2)';%����Աʣ��ʱ��
    oplf=sum(opleft./optask.*opf,2);%����Աʣ��ر�
    [ReOps,Result]=Allocate(task,opx,opw);%������
    sumf=sumf+Result(10);
    reops(:,st:et)=ReOps(:,2:et-st+2);
    reops(:,40+st:et+40)=ReOps(:,et-st+3:2*(et-st)+3);
    optask(:,st:et)=reops(:,st:et)+reops(:,40+st:et+40);
    %��һ�׶�״̬����
    opx=ReOps(:,2*(et-st)+4)';
    opleft(:,st:et)=optask(:,st:et);
    oplefts=sum(opleft,2);
    [tempt,index]=min(oplefts);
    oplests=oplefts-tempt;
    opleft(index,:)=0;
    for i=1:4
        tempi=et;
        while(oplests(i)>0)
            oplests(i)=oplests(i)-opleft(i,tempi);
            if(oplests(i)<=0)
                opleft(i,1:tempi-1)=0;
                opleft(i,tempi)=opleft(i,tempi)+oplests(i);
                break;
            end
            tempi=tempi-1;
        end
    end
    st=et+1;
    et=et+floor(tempt);
    if(quitflag==1)
        break;
    end
end