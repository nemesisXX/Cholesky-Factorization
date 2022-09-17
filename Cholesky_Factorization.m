% Here we construct the matrix of A
A = [2 1 1/2 1/4; 1 4 1 1/2; 1/2 1 4 1; 1/4 1/2 1 2];
%calculate the size of A
[t,n] = size(A);
% and we will verify whether it is spd in the ensuing coding

% Check the symmetric martix
t = issymmetric(A);
if t == 0
    disp("Error message: Non-symmetric matrix");
    return
end

% Check the positive entries
for i = 1: length(A)
    if A(i,:)<=0
        disp("Error message: Non-positive matrix")
        return
    end
end

% Check for singularity
if rank(A) < n
    disp("Error message: the matrix can't be decomposed completely")
    return
end

% Initialization
R = zeros(length(A));
for j = 1:n
    sum_r_jk = 0;
    for k = 1:j-1
        sum_r_jk = sum_r_jk +R(j,k)^2;
    end
    if A(j,j) > sum_r_jk
        R(j,j) = sqrt(A(j,j) - sum_r_jk); 
        for i = j+1:n
            sum_r = 0;
            for k = 1:j-1
                sum_r = sum_r+R(i,k)*R(j,k);
            end
            R(i,j) = (A(i,j)-sum_r)/R(j,j);
        end
    else
        disp("Error message: square root of negative number is wrong.")
    end
end
R
