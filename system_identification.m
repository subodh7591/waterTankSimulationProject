Ts = 0.1;

u = PRBS_signal.signals.values;
y_out = y.signals.values;

data = iddata(y_out, u, Ts);

figure;
plot(data);

N = length(data.y);

data_train = data(1:round(0.7*N));
data_val   = data(round(0.7*N)+1:end);

%% ARX models
model_arx1 = arx(data_train,[1 1 1]);
model_arx2 = arx(data_train,[2 2 1]);
model_arx3 = arx(data_train,[3 3 1]);

%% Print models (THIS FIXES YOUR ISSUE)
disp('ARX Model 1:');
present(model_arx1);

disp('ARX Model 2:');
present(model_arx2);

disp('ARX Model 3:');
present(model_arx3);

%% Compare ARX models
figure;
compare(data_val, model_arx1, model_arx2, model_arx3);
title('ARX Model Comparison');

%% Residual analysis
figure;
resid(data_val, model_arx2);
title('ARX Residuals');

%% Transfer function model
model_tf = tfest(data_train,1);

disp('Transfer Function Model:');
present(model_tf);

%% Validate TF model
figure;
compare(data_val, model_tf);
title('Transfer Function Validation');

figure;
resid(data_val, model_tf);
title('TF Residuals');

disp('System Identification Completed Successfully');