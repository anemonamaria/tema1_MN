function [G_J, c_J] = Jacobi_factorization(A, b)
    n = size(A);
    D =zeros(n,n);
    for i = 1:n
      D(i, i) = A(i, i);
    endfor
    L=tril(A,-1);
    U=triu(A,1);
    Di = inv(D);
    S=L+U;
    G_J = zeros(n,n);
   G_J = Di*S;
    for i = 1 : n
      G_J(i,i) = 0;
    endfor
    G_J = -G_J;
    c_J = zeros(n,1);
    c_J = Di*b;
endfunction
