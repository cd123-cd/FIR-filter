%语音分帧显示
clc;clear all;close all
[x,Fs]=audioread('filtered.wav');  % 读入数据文件
wlen=200; inc=100;                       % 设定帧长和帧移
N=length(x);                             % 获取语音序列长度
time=(0:N-1)/Fs;                         % 计算出取样点时刻
framesignal=enframe (x,hamming(wlen),inc)';        % 调用分帧函数实现分帧
size(framesignal);
i=input('请输入起始帧号(i):');            %输入要显示的连续四帧的首帧序号
flabel=i;
subplot 411;
plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b');              % 画出帧语音波形 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(a)当前波形帧号：', num2str(i)]);
ylabel('幅值'); xlabel('帧长'); 
flabel=i+1;
subplot 412; plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b'); % 画出帧语音波形 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(b)当前波形帧号：', num2str(i+1)]);
ylabel('幅值'); xlabel('帧长'); 
flabel=i+2;
subplot 413; plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b'); % 画出帧语音波形 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(c)当前波形帧号：', num2str(i+2)]);
ylabel('幅值'); xlabel('帧长'); 
flabel=i+3;
subplot 414; plot((flabel-1)*inc+1:(flabel-1)*inc+wlen,framesignal(:,flabel),'b'); % 画出帧语音波形 
xlim([(i-1)*inc+1 (i+2)*inc+wlen]);ylim([-0.1,0.1])
title(['(d)当前波形帧号：', num2str(i+3)]);
ylabel('幅值'); xlabel('帧长'); 
