imgRoot = './data/img_ori/';
imnames=dir([imgRoot '*' 'png']);
Rad = 15;
StdS = 30;
StdR = 15;
for img = 1 : length(imnames)
    fprintf('%04d\n', img)
    strin = sprintf('%s%04d.png', imgRoot, img);
    Isrc = double(imread(strin));
    
    Iout = func_BF(Isrc, Rad, StdS, StdR);
    
    strin = sprintf('./data/img_gt/%04d.png', img);
    imwrite(uint8(Iout), strin);
end
fprintf('done')