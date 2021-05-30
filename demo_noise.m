clear, clc;
imgRoot = './data/img_ori/';
imnames=dir([imgRoot '*' 'png']);
type = 0;
sig = 0.1;
for img = 1 : length(imnames)
    fprintf('%04d\n', img)
    strin = sprintf('%s%04d.png', imgRoot, img);
    Isrc = im2double(imread(strin));
    
    [hei,wid,~] = size(Isrc);
    Iout = func_imnoise(hei, wid, sig, type);
    Iout = max(min(Iout + Isrc, 1), 0);
    
    strin = sprintf('./data/img_noise/%04d.png', img);
    imwrite(Iout, strin);
end
fprintf('done')