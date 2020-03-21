% for loops
for i=1:10,
    v(i) = 2^i;
end;

% different notation
indices = 1:10;
for i=indices,
    disp(i);
end;

% while loop
i = 1;
while i <= 5,
    x(i) = 100;
    i = i+1;
end;

% break + if
i = 1;
while true;
    z(i) = 999;
    i = i+1;
    if i == 6,
        break;
    end;
end;


% if/else
b(1) = 2;
if b(1)==1,
    disp('Value is one');
elseif b(1)==2,
    disp('Value is two');
else
    disp('The value is not one or two')
end;