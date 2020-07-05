% ����ȫ������
load('E:\store\artificial\matconvnet-1.0-beta25\matconvnet-1.0-beta25\examples\mnist\data\mnist-baseline\imdb.mat');
% load('E:\store\artificial\matconvnet-1.0-beta25\matconvnet-1.0-beta25\data\mnist-baseline1-simplenn\imdb.mat');
% ��ѡ�����Լ�
test_index = find(images.set==3);
% ��ѡ�������Լ���ʵ���
test_data = images.data(:,:,:,test_index);
test_label = images.labels(test_index);
%����ģ���ļ�
load('E:\store\artificial\matconvnet-1.0-beta25\matconvnet-1.0-beta25\examples\mnist\data\mnist-baseline\net-epoch-20.mat');
% load('E:\store\artificial\matconvnet-1.0-beta25\matconvnet-1.0-beta25\data\mnist-baseline1-simplenn\net-epoch-20.mat');

% �����һ���Ϊ softmax ��ԭʼΪsoftmaxloss������ѵ���ã�
net.layers{1, end}.type = 'softmax';
% net = vl_simplenn_tidy(net) ;
for i = 1:length(test_label)
    i
    im_ = test_data(:,:,:,i);
    im_ = im_ - images.data_mean;
    res = vl_simplenn(net, im_) ;
    scores = squeeze(gather(res(end).x)) ;
    [bestScore, best] = max(scores) ;
    pre(i) = best;
end
% ����׼ȷ��
accurcy = length(find(pre==test_label))/length(test_label);
disp(['accurcy = ',num2str(accurcy*100),'%']);