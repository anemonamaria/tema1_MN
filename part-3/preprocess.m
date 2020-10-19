function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
	p1 = strcat(path_to_dataset, 'cats/');
	p2 = strcat(path_to_dataset, 'not_cats/');
	cats = getImgNames(p1);
	ncats = getImgNames(p2);
	[n1 l1] = size(cats);
	[n2 l2] = size(ncats);
	n = n1 + n2; 
	m = 3 * count_bins; 
	X = zeros(n, m);
	y = zeros(n, 1);
	while(strcmp(histogram, "RGB") == 0)
		for i = 1 : n1
			X(i, :) = rgbHistogram(strcat(p1, cats(i, 1:l1)), count_bins);
			y(i, 1) = 1;
		endfor
		for i = 1 : n2
			X(i + n1, :) = rgbHistogram(strcat(p2, ncats(i, 1:l2)), count_bins);
			y(i + n1, 1) = -1; 
		endfor
    break
  endwhile
	while(strcmp(histogram, "HSV") == 0)
		for i = 1 : n1
			X(i, :) = hsvHistogram(strcat(p1, cats(i, 1:l1)), count_bins);
			y(i, 1) = 1; 
		endfor
		for i = 1 : n2
			X(i + n1, :) = hsvHistogram(strcat(p2, img = ncats(i, 1:l2)), count_bins);
			y(i + n1, 1) = -1; 
		endfor
    break
	endwhile
  X = [X ones(n,1)];
endfunction
