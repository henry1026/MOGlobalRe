M=2;
st=1;
et=10;
opx=[0.6 0.7 0.8 0.9];
quitflag=0;
ref=0;
%�������Ա�Ĺ���ʱ���ͻر�
reops=zeros(M,81);
optask=zeros(M,41);%���������
opleft=zeros(M,41);%����ʣ��ʱ��
opf=zeros(M,41);%����ر�
for i=1:M
    reops(i,81)=i;
end
optask(:,41)=reops(:,81);
opleft(:,41)=reops(:,81);
for ii=1:20%���Ĳ���ÿ��10������
    if(et>=40)
        et=40;
        quitflag=1;
    end
    group=ones(1,et-st+1);
    task=param(:,st:et);
    %opx=opxs(:,st);%��һ�׶β���Ա������
    opw=sum(opleft,2)';%����Աʣ��ʱ��
    oplf=sum(opleft./optask.*opf,2);%����Աʣ��ر�
    for i=1:M
        [returnf]=DP(group,task,opx(i));
        ref=ref+returnf(1)-sum(c(st:et).*group);%���ս��
        opx(i)=returnf(2+(et-st+1)*2);%����������
        reops(i,st:et)=returnf(2:et-st+2);
        reops(i,40+st:et+40)=returnf(et-st+3:2*(et-st)+3);
        for j=1:et-st+1
            if(returnf(1+j)~=0)
                group(j)=0;
            end
        end
    end
    optask(:,st:et)=reops(:,st:et)+reops(:,40+st:et+40);
    %��һ�׶�״̬����
    opleft(:,st:et)=optask(:,st:et);
    oplefts=sum(opleft(:,1:40),2);
    [a,ind]=sort(oplefts);%��������
    opleft=opleft(ind,:);
    oplefts=oplefts(ind);
    optask=optask(ind,:);
    reops=reops(ind,:);
    opx=opx(ind);
    
    [tempt,index]=min(oplefts);
    oplests=oplefts-tempt;
    if(tempt==0)
        for i=1:M
            if(oplefts(i)==0)
                opx(i)=0.5;
            else
                tempi=1;
                tempsum=-1;
                while(tempsum<0)
                    tempsum=tempsum+opleft(i,tempi);
                    tempi=tempi+1;
                end
            end
        end
        tempt=1;
    else
        opleft(index,:)=0;
        for i=1:M
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
    end
    st=et+1;
    et=et+floor(tempt);
    if(quitflag==1)
        break;
    end
end