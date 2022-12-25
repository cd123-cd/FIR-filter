%��ʱ����Ҷ�任������ͼ��ʾ
clear all;clc; close all;
[x,fs]=audioread('filtered.wav'); % ���������ļ�
framelen=512;                           %֡��
nfft=framelen;
frameinc=256;                           %֡��
win=hamming(framelen);                  %ʹ�ú�����

y=STFFT(x,win,nfft,frameinc);           %���ʱ����Ҷ�任
fn=size(y,2);                           %֡��
freq=(0:framelen/2)*fs/framelen;        %����FFT���Ƶ�ʿ̶�
frameCenterTime=FrameTimeC(fn,framelen,frameinc,fs);%����ÿ֡�е��Ӧ��ʱ��
figure(1)
imagesc(frameCenterTime,freq,20*log10(abs(y)+eps)); %����|y|^2α��ɫӳ��ͼ��  
axis xy;
ylabel('Ƶ��/Hz');xlabel('ʱ��/s');
title('������ͼ');
colormap(jet)
figure(2)
imagesc(frameCenterTime,freq,10*log10(abs(y)+eps)); %����|y|α��ɫӳ��ͼ��  
axis xy;
ylabel('Ƶ��/Hz');xlabel('ʱ��/s');
title('������ͼ');
colormap(jet)
