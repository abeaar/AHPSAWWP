%penyelesaian kasus menggunakan metode WP
clc;clear; %untuk membersihkan jendela command windows
x = [0.75,2000,18,50,500;
    0.50,1500,20,40,450;
    0.90,2050,35,35,800];
    %data rating kecocokan dari masing-masing alternatif
k = [0,0,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w = [5,3,4,4,2];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3= cukup, 4= tinggi, 5= sangat tinggi) 

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;
%tahapan ketiga, proses perangkingan
V= S/sum(S)
