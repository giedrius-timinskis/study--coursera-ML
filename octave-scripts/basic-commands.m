% is the comment
% basic operators
1 + 1; % addition, subtraction, multiplication, division are as you'd expect
2^6; % exponent
1 == 1; % boolean
1 ~= 1; % inequality is different from most programing languages, uses ~
1 && 0;
1 || 0; % and/or as you'd expect

% Adding a semicolon will make an expression NOT print to console
xor(1, 0); % same as or

a=pi;
disp(sprintf('2 decimals: %0.2f', a)); % print command with decimal points

A = [1 2; 3 4; 5 6]; % manual declaration of a matrix
B = [1; 2; 3]; # manual declaration of a vector

C = 0:1:20; % this will create a vector 0-20 with increments of 1
D = 1:10; % shorthand for incrementing by 1

ones(2,3); % generate a 2x3 matrix filled with 1
2*ones(2,3); % generate a 2x3 matrix filled with 2
zeros(1,3); % same but 0
rand(1, 3); % same but random numbers
randn(1, 3); % random with Gaussian distribution

% cool trick - display bell curve
w = -6 + sqrt(10)*(randn(1, 10000));
hist(w, 50)

eye(4); % generates a 4x4 identity matrix

load testData.dat; % loads data from a file
who; % shows all variables in memory. After loading data from file above, testData will become available
whos; % same but in detail
size(testData); % will show dimensions of a matrix
clear testData; % removes variable from memory

save hello.mat A; % save variable A to disk as hello.mat


E = [1 2; 3 4; 5 6];
E(3, 2); % returns 6 - 3rd row 2nd column
E(3,:); % get everything from 3rd row
E([1 3], :); % get first and third rows, all columns from selected rows
E(:, 2) = [10; 11; 12]; % replace second column with these numbers
A = [A, [100; 101; 102]]; % append another column to the right
A(:); % put all elements of A into a single vector

F = [1 2; 3 4; 5 6];
G = [7 8; 9 10; 11 12];
H = [F G]; % Creates a new matrix, concatenating columns
H = [F; G]; % Concatenating rows 

J = [1 2; 3 4; 5 6];
K = [1 1; 2 2];
J*K; % You can perform operations on a 3x2 matrix by a 2x2 matrics for example
F .* G; % You can also just multiple all elements in a matrix by another matrix
F .^ 2; % Square all elements of a matrix

HOHO = [1; 2; 3];
1 ./ HOHO; % get scale of provided number. In this example, [1.00, 0.50, 0.33]

TRANSPOSEMEDADDY = G = [1 2; 3 4; 5 6];
TRANSPOSEMEDADDY' % Will transpose the array. Turns 3x2 into 2x3

L = [1 15 2 0.5];
val = max(L); % returns 15
[val, ind] = max(L); % returns 15 and 2 (1-indexed)
L < 2; % returns booleans for all values less than 2. SO: [1 0 0 1]
find(L < 3); % returns all elements less than 3. SO: [1, 2, 0.5]
