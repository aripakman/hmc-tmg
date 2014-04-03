function []  = brownian_bridge_demo()

% Author: Ari Pakman


%% prepare parameters to call sampler

T=100;
sigma2=1;   %noise level
V0 = -40;
VT=-20;
L = 15500;

% low noise
X1s=bb_call_sampler(T,sigma2,V0,VT,L);

% high noise
sigma2=5;
X2s=bb_call_sampler(T,sigma2,V0,VT,L);


B=500;   % burn-in samples to discard



%%  plot

col=[1 0.78 0.80];  % pinkish

fig=figure(85);
clf
hold on

subplot(1,2,1);
hold on
qu1=quantile(X1s(:,B:end),.25,2);
qu2=quantile(X1s(:,B:end),.5,2);
qu3=quantile(X1s(:,B:end),.75,2);

lower = [V0 qu1' VT];
median = [V0 qu2' VT];
higher = [V0 qu3' VT];


sample_path1= [V0 X1s(:,3000)' VT];
plot(0:T, sample_path1, '--k', 'MarkerSize',6)

ciplot(lower,higher, 0:T,col);

plot(0:T, sample_path1, '--k', 'MarkerSize',6)

plot(0:T,median, 'b', 'MarkerSize',6)
ylim([V0-8 VT]);
box

xl=xlabel('t');
set(xl, 'FontName', 'Arial', 'FontSize', 12);


xl=legend(  'Sample path', '.25, .5 and .75 quantiles');
set(xl, 'FontName', 'Arial', 'FontSize', 7, 'Location', 'NorthWest');


subplot(1,2,2);
cla
hold on
qu1=quantile(X2s(:,B:end),.25,2);
qu2=quantile(X2s(:,B:end),.5,2);
qu3=quantile(X2s(:,B:end),.75,2);

lower = [V0 qu1' VT];
median = [V0 qu2' VT];
higher = [V0 qu3' VT];

sample_path2= [V0 X2s(:,3100)' VT];
plot(0:T, sample_path2, '--k', 'MarkerSize',6)


ciplot(lower,higher, 0:T,col);

plot(0:T,median, 'b', 'MarkerSize',6)
ylim([V0-8 VT]);

plot(0:T, sample_path2, '--k', 'MarkerSize',6)


xl=xlabel('t');
set(xl, 'FontName', 'Arial', 'FontSize', 12);


xl=legend(  'Sample path', '.25, .5 and .75 quantiles');
set(xl, 'FontName', 'Arial', 'FontSize', 7, 'Location', 'NorthWest');

box





end



