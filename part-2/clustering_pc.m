function [centroids] = clustering_pc(points, NC)
   [n m] = size(points);
   centroids = zeros(NC, m);
   x=0;
   j=0;
   for i = 1:n
     j=0;
     i;
     s = i + j*NC;
     x = x +1;
     while mod(i,NC) == 0 && s <= n && x <= NC 
       centroids(x, :) = centroids(x, :) + points(s, :);
       j = j + 1;
       s = i + j*NC;
     endwhile
     while mod(s, NC) == i && s <= n && x <= NC 
       centroids(x, :) = centroids(x, :) + points(s, :);
       j = j + 1;
       s = i + j*NC;
     endwhile
   endfor
   k = n / NC;
  centroids = 1/k *centroids ;
  centroids1 = zeros(size(centroids));
  A = zeros(NC, n);
  s = 0;
  do 
    centroids1 = centroids;
    stp = zeros(NC, 1);
    A = zeros(NC, n);
    for i = 1 : n
      min = norm(points(i, :) - centroids(1, :));
      p = 1;
      for j = 2 : NC
        tmp = norm(points(i, :) - centroids(j, :));
        if(tmp < min)
          min = tmp;
          p = j;
        endif
      endfor
      stp(p)++;
      A(p, stp(p)) = i;
    endfor
    for i = 1 : 1800
      s = s + 1;
    endfor
    centroids;
    for i = 1 : NC
      if(stp(i) != 0)
       centroids(i, :) = sum(points(A(i, 1 : stp(i)), :)) / stp(i);
      endif
    endfor
  until ( norm(centroids - centroids1) == 0 )
endfunction