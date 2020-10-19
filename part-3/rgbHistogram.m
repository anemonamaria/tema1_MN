function [sol] = rgbHistogram(path_to_image, count_bins)
	ColorMatrix = imread(path_to_image);
	for i = 0 : (count_bins - 1)
		j=1;
		r(i + 1) = sum(sum((ColorMatrix(:, :, j) >= (i * (256 / count_bins)) & ColorMatrix(:, :, j) < ((i + 1) * (256 / count_bins)))));
		j=j+1;
		g(i + 1) = sum(sum((ColorMatrix(:, :, j) >= (i * (256 / count_bins)) & ColorMatrix(:, :, j) < ((i + 1) * (256 / count_bins)))));
		j=j+1;
		b(i + 1) = sum(sum((ColorMatrix(:, :, j) >= (i * (256 / count_bins)) & ColorMatrix(:, :, j) < ((i + 1) * (256 / count_bins)))));
	endfor
	sol = [r, g, b];
end
