function Iout = func_TPBF(Isrc, Iref, Rad, StdS, StdR, L_BIT)

L_X1 = bitshift(1, L_BIT);

iKg = zeros(1,2*Rad+1);
for i = 0 : 1 : Rad
    iKg(Rad+i+1) = exp(-(i^2)/2/(StdS^2));
    iKg(Rad-i+1) = exp(-(i^2)/2/(StdS^2));
end
iKs = iKg' * iKg;
iKr = zeros(1, L_X1);
for i = 0 : 1 : L_X1 - 1
    iKr(i+1) = exp(-(i^2)/2/(StdR^2));
end

[Hei,Wid] = size(Isrc);
Iout = zeros(Hei,Wid);
for h = 1 : 1 : Hei
    for w = 1 : 1 : Wid
        SumUp = 0;
        SumDn = 0;
        for sh = -Rad : 1 : Rad
            i = min(max(h + sh, 1), Hei);
            for sw = -Rad : 1 : Rad
                j = min(max(w + sw, 1), Wid);
                PxlDif = round(abs(Isrc(i,j) - Iref(h,w)) * (L_X1 - 1));
				SumUp = SumUp + Iref(i,j) * iKs(sh+Rad+1, sw+Rad+1) * iKr(PxlDif+1);
                SumDn = SumDn + iKs(sh+Rad+1, sw+Rad+1) * iKr(PxlDif+1);
            end
        end
        if SumDn < 0.0001
            Iout(h,w) = Isrc(h, w);
        else
            Iout(h,w) = max(min(SumUp / SumDn, 1), 0);
        end
    end
end

end