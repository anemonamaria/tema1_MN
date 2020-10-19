function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  [n m ] = size(c);
  x0 = zeros(n,m);
  step = 1;
  for i = 1 : 800
    y = csr_multiplication(G_values, G_colind, G_rowptr, x0);
    [x] = y + c;
    x0 = x;
    step = step + 1;
    if norm(csr_multiplication(G_values, G_colind, G_rowptr, x0) - c) < tol
      break
    endif
  endfor
endfunction
