function [Max_Supply_Score]=ahp()

disp ('Matriks Perbandingan Berpasangan pada Kriteria');

MPBk = [1/1 3/1 2/1 2/1;
        1/3 1/1 1/3 1/2;
        1/2 3/1 1/1 1/1;
        1/2 2/1 1/1 1/1]
    
w_MPB = calc_norm(MPBk)

[m n]=size(w_MPB);
for i=1 : m 
    sumRow = 0;
    for j=1 : n,
        sumRow = sumRow + w_MPB(i,j);
    end;
  V(i) = (sumRow);
end;

disp('Eigenvector')
w_MPB = transpose (V)/m

disp ('Perbandingan Kualitas : Alternatif Kuantitatif');
ptA = 85;
ptB = 80;
ptC = 90;
ptD = 95;

ACM_Fe = [ptA;
           ptB;
           ptC;
           ptD]
w_E = calc_norm (ACM_Fe)

disp('Perbandingan Fleksibilitas pembayaran : Alternatif kualitas berpasangan');
AKB_F = [1/1 2/1 3/1 4/1;
         1/2 1/1 2/1 3/1;
         1/3 1/2 1/1 2/1;
         1/4 1/3 1/2 1/1]
     
w_F = calc_norm(AKB_F)

[m n]=size(w_F);
for i=1 : m 
    sumRow = 0;
    for j=1 : n,
        sumRow = sumRow + w_F(i,j);
    end;
  V(i) = (sumRow);
end;

disp('Eigenvector')
w_F = transpose (V)/m

disp('Perbandingan pemenuhan pemesanan : Alternatif kualitas berpasangan');
AKB_P = [1/1 2/1 1/2 1/3;
         1/2 1/1 1/3 1/4;
         2/1 3/1 1/1 1/2;
         3/1 4/1 2/1 1/1]
     
w_P = calc_norm(AKB_P)

[m n]=size(w_P);
for i=1 : m 
    sumRow = 0;
    for j=1 : n,
        sumRow = sumRow + w_P(i,j);
    end;
  V(i) = (sumRow);
end;

disp('Eigenvector')
w_P = transpose (V)/m

disp('Perbandingan Waktu : Alternatif kualitas berpasangan');
AKB_W = [1/1 2/1 3/1 1/2;
         1/2 1/1 2/1 1/3;
         1/3 1/2 1/1 1/4;
         2/1 3/1 4/1 1/1]
     
w_W = calc_norm(AKB_W)

[m n]=size(w_W);
for i=1 : m 
    sumRow = 0;
    for j=1 : n,
        sumRow = sumRow + w_W(i,j);
    end;
  V(i) = (sumRow);
end;

disp('Eigenvector')
w_W = transpose (V)/m

wM = [w_E w_F w_P w_W];

disp ('Nilai Akhir ');
MC_Scores = wM * w_MPB

disp ('Nilai terbaik');

Max_MX_Benefits = max(MC_Scores)
    function [normvect] = calc_norm(M)
        sM=sum(M);
        normvect = M./sM;
        disp ('Normalisasi Matriks')
    end
end


