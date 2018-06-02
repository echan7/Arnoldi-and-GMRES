function [Q,S] = Q1(A,b,n)

j = length(A);
if nargin < 3, n = j; end
b = b/norm(b);
Q = zeros(j,n); Q(:,1) = b;
S = zeros(min(n+1,n),n);

for k=1:n
    z = A*Q(:,k);
    for i=1:k
        S(i,k) = Q(:,i)'*z;
        z = z - S(i,k)*Q(:,i);
    end
    if k < j
       S(k+1,k) = norm(z);
       if S(k+1,k) == 0, return, end
       Q(:,k+1) = z/S(k+1,k);
   end
end
S(end, :) = [];
