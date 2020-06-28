hiddennum = 6;
all_data = load('herbicide.txt');
input_train = all_data(1:40,1:7)';
output_train = all_data(1:40,8)';
input_test = all_data(41:50,1:7)';
output_test = all_data(41:50,8)'
[inputn,inputps] = mapminmax(input_train);
[outputn,outputps] = mapminmax(output_train);

net = newff(minmax(inputn),minmax(outputn),hiddennum,{'logsig','purelin'},'trainlm');
net.trainparam.epochs = 2000;
neb_trainparam.goal = 0.00001;
net.trainparam.lr = 0.1;
net = train(net,inputn,outputn);

inputn_test = mapminmax('apply',input_test,inputps);
an = sim(net,inputn_test);
test_simu = mapminmax('reverse',an,outputps);
test_simu

