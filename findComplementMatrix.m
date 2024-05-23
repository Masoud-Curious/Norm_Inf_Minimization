function complementMatrix = findComplementMatrix(x_L2, m, n)
% This function receives a list of values and makes a matrix with -1
% entries on its last column. At row i, the column corresponding to the
% index of the largest ith element of x_L2 equals the sign of the largest ith element of
% x_L2.

% Inputs: 
% a. x_L2: List of input values
% b. m and n: input dimensions to make the output matrix complementMatrix
complementMatrix = zeros(n-m+1,n+1);

%% Find the largest (n-m) elements of L2 solution in the sense of absolute value

[~,indexList] = sort(abs(x_L2),'descend');

%% Find the Elements of complementMatrix  

for i = 1 : n-m+1
    largestElement_i = x_L2(indexList(i));
    complementMatrix(i,indexList(i)) = sign(largestElement_i);
    complementMatrix(i,end) = -1;
end