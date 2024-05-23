function x_Inf_Solution = findNormInfSolution(A,b)
% This function finds the solution to the following norm minimization:
% minimize norm_inf(x) 
% subject to A * x = b
% A is mxn where n > m and the equations are underdetermined
% There are many solutions to norm_inf minimization. We choose the solution
% that seeks to minimize the first (n - m + 1) largest elements of the norm_2
% minimization. These elements will be equal to the optimal value of
% norm_inf

m = size(A,1);
n = size(A,2);
%% Find Norm_2 Minimzed Solution

x_L2 = (A' / (A * A')) * b; % A' \ (A * A') is the right pseudo inverse of A


complementMatrix = findComplementMatrix(x_L2, m, n);

%% Find the solverMatrix
% This matrix has the initial linear equation A * x = b and our enforced
% equations to maximize the largest (n-m) elements of 
solverMatrix = [A zeros(m,1); complementMatrix];
bTilde = [b;zeros(n-m+1,1)];
x_L2
x_Inf_Solution = solverMatrix\bTilde;




