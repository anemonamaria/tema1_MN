function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
	p1 = strcat(path_to_testset, 'cats/');
	p2 = strcat(path_to_testset, 'not_cats/');
	cats = getImgNames(p1);
	ncats = getImgNames(p2);
	[n1 l1] = size(cats);
	[n2 l2] = size(ncats);
  n = n1+n2;
  nr = 1;
  while(strcmp(histogram, "HSV")==0)
		for i = 1 : n1
			x = hsvHistogram(strcat(p1, cats(i, 1:l1)), count_bins)';
			x = [x; 1];
			if (w' * x>= 0)
				nr = nr + 1;
			endif
		endfor
		for i = 1 : n2
			x = hsvHistogram(strcat(p2, ncats(i, 1:l2)), count_bins)';
			x = [x; 1];
			if (w' * x >= 0)
				nr = nr + 1;
			endif
		endfor
    break
	endwhile
	while(strcmp(histogram, "RGB")==0)
		for i = 1 : n1
			x = rgbHistogram(strcat(p1, cats(i, 1:l1)), count_bins)';
			x = [x; 1]; 
			if (w' * x >= 0)
				nr = nr + 1;
			endif
		endfor
		for i = 1 : n2
			x = rgbHistogram(strcat(p2, ncats(i, 1:l2)), count_bins)';
			x = [x; 1];
			if (w' * x < 0)
				nr = nr + 1;
			endif
		endfor
    break
    endwhile
	percentage = (nr-1) * 100 / n;
endfunction
