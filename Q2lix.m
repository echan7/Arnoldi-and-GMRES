%fprintf('%15s %6i %10i %10i %10i\n', 'n=',5,10,20,90)
for e=1:5
    es = [1 0.5 0 -0.5 -1];
    eps = 10^(es(e));
    P = rand(100);
    eigs = rand(100, 1)*3
    for i =1:100
        if(eigs(i) < 1)
                eigs(i) = 4 + (eigs(i) - 0.5)*eps;
        elseif(eigs(i) < 2)
                eigs(i) = 5 + (eigs(i) - 1.5)*eps;
        else 
                eigs(i) = 10 + (eigs(i) - 2.5)*eps;
        end
    end
    D = diag(eigs);
    A = P*D*inv(P);
    b = rand(100,1);
    x_star = A\b;
    
    for i=1:4
        ns = [5 10 20 90];
        error(i,e) = gmres(A,b,ns(i));
    end
    
    %fprintf('%-15s %10.3e %10.3e %10.3e %10.3e\n', ['eps = 10^(' num2str(es(e)) ')'], error(e, :))
    
end