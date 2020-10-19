function [A, b] = generate_probabilities_system(rows)
  s = 1;
  for i = 1 : rows
    for j = 1 : i
      C(i, j) = s;
      s = s + 1;
    endfor
  endfor
  nr = s - 1;
  C=zeros(nr,nr);
  s = 1;
  for i = 1 : rows
    for j = 1 : i
      C(i, j) = s;
      s = s + 1;
    endfor
  endfor
   C(1,1)=1;
   M = zeros(nr,nr);
   for i=1:rows
     for j=1:i
       M(i,j)=-1;
     endfor
   endfor
   M(1,1) = -1;
  b = zeros(nr, 1);
  for k = s - rows : s - 1
    b(k, 1) = 1;
  endfor
  A = zeros(nr, nr);
  A(1,1)=A(nr,nr)=4;
  A(1,2)=A(1,3)= -1;
  A(nr,nr-1)=A(nr,nr-rows)=-1;
  P=zeros(nr, nr);
  P(2,1)=P(2,2)=5;
  for i=3:rows
    for j=1:i
      P(i,j)=5;
    endfor
  endfor
  P(1,1)=P(rows,rows)=P(rows,1)=4;
  for i=3:rows-1
    for j=2:i-1
      P(i,j)=6;
    endfor
  endfor
  P(rows,1)=4;
  f = 2;
   for j = 2:rows
     for k = 1:j
        A(f, f) = P(j, k)
        f = f + 1;
      endfor
    endfor
    for i = 2 : rows-1 
      for j = 2 : i 
        n = C(i,j);
        n1=C(i-1,j-1);
        n2=C(i-1,j);
        n3=C(i,j-1);
        n4=C(i,j+1);
        n5=C(i+1,j);
        n6=C(i+1,j+1);
          if P(i,j) == 6
            A(n,n1) = -1;
            A(n,n2) = -1;
            A(n,n3) = -1;
            A(n,n4) = -1;
            A(n, n5) = -1;
            A(n, n6) = -1;
        endif       
        if P(i,j) == 5
           A(n,n1) = -1;
           A(n,n3) = -1;
           A(n, n5) = -1;
           A(n, n6) = -1;
         endif
      endfor
    endfor
    for j = 2 : rows-1
      n = C(rows,j);
      n1 = C(rows-1,j-1);
      n3= C(rows-1,j);
      n4 = C(rows,j-1);
      n5 = C(rows, j+1);
      if P(rows,j) == 5
        A(n,n1) = -1;
        A(n, n3) = -1; 
        A(n, n4) = -1;
        A(n , n5) = -1;
      endif
    endfor
    for j = 1 : rows - 1
      n2 = C(rows, j+1);
      n1 = C(rows-1, j);
      n = C(rows, j);
      if P(rows,j) == 4
        A(n, n2) = -1;
        A(n, n1) = -1;
      endif
    endfor
    for i = 2 : rows -1
      n = C(i, 1);
      n1 = C(i-1,1);
      n2 = C(i,2);
      n3 = C(i+1,1);
      n4 = C(i+1,2);
      if P(i,1) == 5
        A(n,n1) = -1;
        A(n, n2) = -1;
        A(n, n3) = -1;
        A(n, n4) = -1;
      endif
    endfor
endfunction  
