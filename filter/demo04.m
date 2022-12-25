%短时傅里叶变换＆语谱图显示
clear all;clc; close all;
[x,fs]=audioread('filtered.wav'); % 读入数据文件
framelen=512;                           %帧长
nfft=framelen;
frameinc=256;                           %帧移
win=hamming(framelen);                  %使用汉明窗

y=STFFT(x,win,nfft,frameinc);           %求短时傅里叶变换
fn=size(y,2);                           %帧数
freq=(0:framelen/2)*fs/framelen;        %计算FFT后的频率刻度
frameCenterTime=FrameTimeC(fn,framelen,frameinc,fs);%计算每帧中点对应的时间
figure(1)
imagesc(frameCenterTime,freq,20*log10(abs(y)+eps)); %画出|y|^2伪彩色映射图像  
axis xy;
ylabel('频率/Hz');xlabel('时间/s');
title('能量谱图');
colormap(jet)
figure(2)
imagesc(frameCenterTime,freq,10*log10(abs(y)+eps)); %画出|y|伪彩色映射图像  
axis xy;
ylabel('频率/Hz');xlabel('时间/s');
title('幅度谱图');
colormap(jet)
