%������֡��ʾ
clc;clear all;close all
[x,Fs]=audioread('filtered.wav');  % ���������ļ�
wlen=200; inc=100;                       % �趨֡����֡��
N=length(x);                             % ��ȡ�������г���
time=(0:N-1)/Fs;                         % �����ȡ����ʱ��
framesignal=enframe (x,hamming(wlen),inc)';        % ���÷�֡����ʵ�ַ�֡
size(framesignal);
i=input('��������ʼ֡��(i):');            %����Ҫ��ʾ��������֡����֡���
flabel=i;
subplot 411;
plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b');              % ����֡�������� 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(a)��ǰ����֡�ţ�', num2str(i)]);
ylabel('��ֵ'); xlabel('֡��'); 
flabel=i+1;
subplot 412; plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b'); % ����֡�������� 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(b)��ǰ����֡�ţ�', num2str(i+1)]);
ylabel('��ֵ'); xlabel('֡��'); 
flabel=i+2;
subplot 413; plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b'); % ����֡�������� 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(c)��ǰ����֡�ţ�', num2str(i+2)]);
ylabel('��ֵ'); xlabel('֡��'); 
flabel=i+3;
subplot 414; plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b'); % ����֡�������� 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(d)��ǰ����֡�ţ�', num2str(i+3)]);
ylabel('��ֵ'); xlabel('֡��'); 
