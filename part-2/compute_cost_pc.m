function [cost] = compute_cost_pc(points, centroids) 
    [x y] = size(points);
    [v w]= size(centroids);
    cost = 0;
    for k = 1:x
	A = repmat(points(k,:), v , 1);
	A = (A -centroids).^2;
	A=A';
        d = ((sum(A)).^(1/2));
	d=d';
        cost = cost + min(d);
    end
endfunction

