imgRoot = './img_noise/';
imnames=dir([imgRoot '*' 'png']);
Rad = 15;
StdS = 30;
StdR_P2 = 10;
StdR_P1 = StdR_P2 * 2;
L_BIT = 8;
for img = 1 : length(imnames)
    fprintf('%04d', img)
    strin = sprintf('./crop_img_noise/Set5/%04d.png', img);
    Isrc = im2double(imread(strin));
    
    Iref = func_TPBF(Isrc, Isrc, Rad, StdS, StdR_P1, L_BIT);    
    Iout = func_TPBF(Isrc, Iref, Rad, StdS, StdR_P2, L_BIT);
    
    strin = sprintf('./img_output/%04d_TPBF.png', img);
    imwrite(Iout, strin);
end
