function [x,r] = Q2(A,b,M)

n = length(A);
Q = zeros(n,M);  
H = zeros(M,M-1);
% Initial "solution" is zero.
r(1) = norm(b);

v = b/norm(b);
[v, g] = size(v);

k=M;
[Q,H] = Q1(A,k,v);
  
  % Solve the GMRES problem with the current Q.
  z = (A*Q(:,1:M)) \ b;
  x = Q(:,1:M)*z;
  r = norm( A*x - b );