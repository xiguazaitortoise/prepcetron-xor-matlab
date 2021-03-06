clear all;
pr1=[0 1;0 1];%设置随机感知器层输入问题每个元素的值域
while 1
net1=newp(pr1,3);
% 指定随机感知器层权值初始化函数为随机函数
net1.inputweights{1}.initFcn='rands';
% 指定随机感知器层阈值初始化函数为随机函数
net1.biases{1}.initFcn='rands';
net1=init(net1);%初始化随机感知器层
iw1=net1.iw{1};
b1=net1.b{1};
% 随机感知器层仿真
p1=[0 0;0 1;1 0;1 1]';%随机感知器输入向量（样本）
[a1,pf]=sim(net1,p1);
% 初始化第二层感知器层
pr2=[0 1;0 1;0 1];%设置第二感知器输入向量每个元素的值域
net2=newp(pr2,1);%定义第二感知器层
% 训练第二感知器层
net2.trainParam.epochs=10;
net2.trainParam.show=1;
p2=ones(3,4);%初始化第二感知器层的输入向量
p2=p2.*a1;%随机感知器层的仿真输出结果作为第二感知器的输入向量
t2=[0 1 1 0];%第二感知器层的目标向量
% 训练第二感知器层
[net2,tr2]=train(net2,p2,t2);
a2=sim(net2,p2)
if a2==t2
    break
end
end
disp('输出训练过程经过的每一步长为：')
epoch2=tr2.epoch
disp('输出训练过程经过的恶误差：')
perf2=tr2.perf
disp('第二感知器的权值向量为：')
iw2=net2.iw{1}
disp('第二感知器的阈值向量为：')
iw2=net2.b{1}




