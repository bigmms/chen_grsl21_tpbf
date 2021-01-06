clear, clc;
dataset = ["place2_val"];
for i = 1 : 1 : length(dataset)
    title_Isrc = './crop_img_noise/'+ dataset(1, i);
    title_Iout = './crop_img_output/'+ dataset(1, i);
    Files = dir(char(title_Isrc));
    
    Rad = 15;
    StdS = 30;
    StdR_P2 = 10;
    StdR_P1 = StdR_P2 * 2;
    L_BIT = 8;
    avgtime = 0;
    for k = 3 : 1 : length(Files)
        strin = sprintf('%s/%s', title_Isrc, Files(k).name);
        Isrc = im2double(imread(strin));
        [hei,wid,~] = size(Isrc);
        Isrc = im2double(imread(strin));

        % Two-Pass Bilateral Filtering
        timer1=tic;
        Iref = func_TPBF(Isrc, Isrc, Rad, StdS, StdR_P1, L_BIT);
        
        Iout = func_TPBF(Isrc, Iref, Rad, StdS, StdR_P2, L_BIT);
        avgtime = toc(timer1)+avgtime;
        strin = sprintf('%s/%04d_TPBF.png', title_Iout, k - 2);
        imwrite(Iout, strin);
        
    end
    fprintf('Avg time = %f sec\n', (avgtime / (length(Files) - 2)));
end