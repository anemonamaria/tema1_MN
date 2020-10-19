function [values, colind, rowptr] = matrix_to_csr(A)
  n = size(A); 
  nz = 0; 
  for i = 1 : n
    for j = 1 : n
      if A(i, j) != 0
        nz = nz + 1;
        values(nz) = A(i,j); 
        colind(nz) = j; 
        p(n) = n;
      endif
    endfor
  endfor
  rowptr(1)=1;
  rowptr(n+1) = nz + 1;
  k=2;
  for i = 1 : nz - 1
    if colind(i) > colind (i+1)
      rowptr(k) = i+1;
      k = k+1;
    endif
  endfor  
endfunction
