clear all;

talepDizi=[4 12 8 4 8]; %talep gun periyotlari
imalDizi=[18 13 25 5 18]; %uretim sureleri
        
boluma=false;	%birinci bolum dolu mu
bolumb=false;   %ikinci bolum dolu mu

aUretimSuresi=-1;  %birinci bolum bir uretimin suresi
bUretimSuresi=-1;  %ikinci bolum bir uretimin suresi

aGecenGun=0;    %birinci bolum bir uretimde gecen gun
bGecenGun=0;    %ikinci bolum bir uretimde gecen gun
        
aSayac=0;       %birinci bolum uretimde toplam gecen gun
bSayac=0;       %ikinci bolum uretimde toplam gecen gun
        
uretilen=0;     %toplam uretilen urun
talepAdet=5;    %incelenecek talep sayisi
talepNo=1;      %talep numarasi

gun=1;          %gecen gun sayaci
talepGunu=talepDizi(1); %yeni talep gunu


while (uretilen<talepAdet)
    
    % a bolumu uretime devam ediyor ise
    if(aGecenGun < aUretimSuresi)
        aSayac = aSayac + 1; %a nin toplam uretim gununu 1 arttir
    	aGecenGun = aGecenGun + 1; %son uretimi icin gecen gunu 1 arttir
    end
    
    % b bolumu uretime devam ediyor ise
    if(bGecenGun < bUretimSuresi)
        bSayac = bSayac + 1; %b nin toplam uretim gununu 1 arttir
        bGecenGun = bGecenGun + 1; %son uretimi icin gecen gunu 1 arttir
    end
    
    % a bolumu uretimin son gununde ise
    if(aGecenGun==aUretimSuresi)
    	aGecenGun=0; %son uretim icin gecen gunu sifirla
        aUretimSuresi=-1; %son talebin uretim suresini sifirla
    	boluma=false; %a bolumu bos
    	uretilen=uretilen+1; %uretimi tamamlanan urun sayisini 1 arttir
    end
    
    % b bolumu uretimin son gununde ise
    if(bGecenGun==bUretimSuresi)
    	bGecenGun=0; %son uretim icin gecen gunu sifirla
    	bUretimSuresi=-1; %son talebin uretim suresini sifirla
    	bolumb=false; %b bolumu bos
        uretilen=uretilen+1; %uretimi tamamlanan urun sayisini 1 arttir
    end
    
    % yeni talep gunu geldiyse
    if(talepGunu==gun)
        
        %a bolumu bos mu
        if(boluma==false)
           aUretimSuresi=imalDizi(talepNo); %yeni talebin uretim suresi
           boluma=true; %a bolumu dolu
           talepNo=talepNo+1; %talep sayisini 1 arttir
           if(talepNo<talepAdet+1) %dizi sonraki eleman bossa hata vermemesi icin
                talepGunu=talepGunu+talepDizi(talepNo); %sonraki talep gunu
           end
        %degilse b bolumu bos mu
        elseif(bolumb==false)
           bUretimSuresi=imalDizi(talepNo); %yeni talebin uretim suresi
           bolumb=true; %b bolumu dolu
           talepNo=talepNo+1; %talep sayisini 1 arttir
           if(talepNo<talepAdet+1) %dizi sonraki eleman bossa hata vermemesi icin
                talepGunu=talepGunu+talepDizi(talepNo); %sonraki talep gunu
           end
        %her ikisi doluysa
        else
            talepGunu=talepGunu+1; %yeni talebi 1 gun ertele
        end
        
    end
    
    gun=gun+1; %gecen gunu 1 arttir
end 

aToplamKar=aSayac*1000/4; %a bolumunde toplam kar, toplam maliyetin 4'te 1'i
bToplamKar=bSayac*1200/4; %b bolumunde toplam kar, toplam maliyetin 4'te 1'i
kar=aToplamKar+bToplamKar; %toplam kar

fprintf("1. bölümde %d günlük üretimde toplam kâr: %d\n" , aSayac, aToplamKar);
fprintf("2. bölümde %d günlük üretimde toplam kâr: %d\n" , bSayac, bToplamKar);
fprintf("Fabrikada toplam kâr %d\n" , kar)