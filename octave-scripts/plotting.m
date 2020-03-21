t = [0:0.01:0.98];
y1 = sin(2*pi*4*t);

y2 = cos(2*pi*4*t);
plot(t,y1);
hold on; % doesnt remove previous plot result
plot(t,y2, 'r');


% annotation for the plot
xlabel('time')
ylabel('value')
legend('sin', 'cos')
title('my plot')

% write to file:
%print -dpng 'myPlot.png';

subplot(1,2,1); % divide plot into a 1x2 grod and access first element
plot(t,y1);
subplot(1,2,2);
plot(t,y2);
axis([0.5 1 -1 1]); % sets horizontal axis from 0.5 to 1 and vertical from -1 to 1

clf; % clears a figure