clear;clc;
all_data = load('herbicide.txt');
p_train = all_data(1:40,1:7);
t_train = all_data(1:40,8);
p_test = all_data(41:50,1:7);
t_test = all_data(41:50,8);

gprMdl = fitrgp(p_train,t_train,'KernelFunction','matern32');
cgprMdl = compact(gprMdl);
[ypred,~,yci] = predict(cgprMdl,p_test);
ypred'
t_test'
