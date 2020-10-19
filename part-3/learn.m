function [w] = learn(X, y)
	A = X' * X;
	b = X' * y;
	[n n] = size(A);
	L = eye(n);
	U = zeros(n);
	for p = 1 : n
		for j = p : n
			s = 0;
			for k = 1 : p-1
				s = s + L(p, k) * U(k, j);
			endfor
			U(p, j) = A(p, j) - s;
		endfor
		for i = p+1 : n
			s = 0;
			for k = 1 : p-1
				s = s + L(i, k) * U(k, p);
			endfor
			L(i, p) = (A(i, p) - s) / U(p, p);
		endfor
	endfor
  [n, m] = size(L);
  t = zeros(n,1);
  for i = 1: n
    s = 0;
    for j = 1 : (i -1)
      s += (L(i,j)*t(j));
    endfor
    t(i) = (b(i)-s) / L(i,i);
  endfor
	w = SST(U, t); 
   [n,m] = size (U);
  w = zeros(n, 1);
  for i = n : -1 : 1
    s = 0;
    for j = (i+1) : n
      s += (U(i,j)*w(j));
    endfor
    w(i) = (t(i) - s) / U(i,i);
  endfor
end

