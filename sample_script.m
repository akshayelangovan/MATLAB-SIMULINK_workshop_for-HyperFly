% sample script

clc % clear the command window
clear % clear the workspace

A = 10;
disp('If statement')
if (mod(A,2)==0) % iseven(A)
    disp('A is even')
else
    disp('A is odd')
end

disp('For loop')
for i = 1:0.5:10
    disp(i)
end

disp('While loop')
while i<=12
    disp(i)
    i=i+1;
end

disp('Switch case')
switch A
    case 5
        disp('A is 5')
    case 6
        disp('A is 6')
    otherwise
        disp('I know A is neither 5 nor 6')
end