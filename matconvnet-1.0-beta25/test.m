net = load('imagenet-vgg-f.mat');

%���벢Ԥ����һ��ͼ��
im = imread('peppers.png'); %����matlab�Դ�ͼ��
im_ = imresize(single(im), net.meta.normalization.imageSize(1:2)); %ת��ͼ����������ͣ��淶������ͼ��Ŀ��
im_ = im_ - net.meta.normalization.averageImage; %������ͼ���ȥģ�;�ֵ

%����CNN
res = vl_simplenn(net, im_); %����һ��res�ṹ����������

%չʾ������
scores = squeeze(gather(res(end).x)); %�õ�ͼ�����ڸ�������ĸ���
[bestScore, best] = max(scores); %�õ�������ֵ����������ֵ
figure(1) ; clf ; imagesc(im); %��ʾͼ��
title(sprintf('%s (%d), score %.3f',net.meta.classes.description{best}, best, bestScore)); %��ӱ��⡪��"����(�ڼ���),��������ĸ���"