function [sol] = hsvHistogram(path_to_image, count_bins)
	IMAGE = imread(path_to_image);
	r = double(IMAGE(:, :, 1));
	g = double(IMAGE(:, :, 2));
	b = double(IMAGE(:, :, 3)); 
  r = r/255;
  g = g/255;
  b = b/255;
	h = zeros(size(r));
	s = zeros(size(r));
	v = zeros(size(r));
	r_max = ( max(r, max(g, b)) == r);
	g_max = ( max(r, max(g, b)) == g);
	b_max = ( max(r, max(g, b)) == b);
	diff = (max(r, max(g, b)) - min(r, min(g, b)) == 0);
	cm_r = 60 * mod((g - b) ./ (max(r, max(g, b)) - min(r, min(g, b))), 6);
	cm_g = 60 * ((b - r) ./ (max(r, max(g, b)) - min(r, min(g, b))) + 2);
	cm_b = 60 * ((r - g) ./ (max(r, max(g, b)) - min(r, min(g, b))) + 4);
	h(r_max) = cm_r(r_max)/360;
	h(g_max) = cm_g(g_max)/360;
	h(b_max) = cm_b(b_max)/360;
	h(diff) = 0;
	cm = ( max(r, max(g, b)) == 0); 
	s = (max(r, max(g, b)) - min(r, min(g, b))) ./  max(r, max(g, b));
	s(cm) = 0; 
	for i = 0 : (count_bins - 1)
		h1(i + 1) = sum(sum((h >= (i * (1.01 / count_bins)) & h < ((i + 1) * (1.01 / count_bins)))));
		s1(i + 1) = sum(sum((s >= (i * (1.01 / count_bins)) & s < ((i + 1) * (1.01 / count_bins)))));
		v1(i + 1) = sum(sum((max(r, max(g, b)) >= (i * (1.01 / count_bins)) &  max(r, max(g, b)) < ((i + 1) * (1.01 / count_bins)))));
	endfor
	sol = [h1, s1, v1];
end
