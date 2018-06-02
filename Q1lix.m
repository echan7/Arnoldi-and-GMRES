A = rand(100, 100);
spectrumA = eigs(A, 100);

count = 1;

x =(1:100)';
b = A*x;

for i=4:10:44
    [Q, S] = arnoldi(A, b, i);
   % size(Q)
   % size(S)
    
    spectrumS = eigs(S, i);
    spectrumS(1) = spectrumS(1) + 0.0000001i;
    figure(count)
    count = count+ 1;
    hold on
    plot(spectrumA, '*')
    plot(spectrumS, 'o')
    title([' N = ', num2str(i)]);
    hold off
    
    
end