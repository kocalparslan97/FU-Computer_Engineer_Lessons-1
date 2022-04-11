function f=simulation(gun)
    
    toplamMusteri=0;    %Sisteme Giren Toplam Musteri
    toplamBekleme = 0;  %Müsterilerin Sistemde Toplam Bekledigi Zaman
    harcananZaman = 0;  %Müsterilerin Sistemde Toplam Harcadigi Zaman
    taksiMesgul = 0;    %Taksinin Mesgul Oldugu Toplam Zaman
    
    t=[];   %Grafik Icin Gecen Zaman (t)
    lq=[];   %Grafik Icin Her t Aninda Bekleyen Musteri Sayisi (LQ(t))
    l=[];   %Grafik Icin Her t Aninda Toplam Musteri Sayisi (L(t))
    d=[];   %Grafik Icin Her t Aninda Sistemin Dolulugu
    
    m=[];   %Grafik Icin Musteri Sayisi
    b=[];   %Grafik Icin Her Musterinin Bekleme Suresi
    
    zaman=1; %Toplam Zaman
    
    %Her Yeni Gun Icin Fonksiyona Girilen Gun Kadar Modelleme Yapilacak
    for i=1:gun
        
        %Her Yeni Gun Icin Rastgele Degerlere Gore Sureler Diziye Atilir
        musteriVaris=randomVaris();
        musteriServis=randomServis();
        
        %Yeni Gunun Siradaki Musterisi
        siradaki = 1;
        
        %Musteri Gelis Zamani ve Servis Bitis Zamani
        geliszamani = 0;
        servisbitis = 0;
        
        %Kuyrukta Bekleyen Musteri Sayisi ve Taksinin Doluluk Durumu
        bekleyen=0;
        doluluk = false;
        
        %09:00 - 15:00 Calisma Araligi Icin Zaman = 360 dk
        for j=0:360
            
            %Grafikler Icin Degerler Dizilere Alinir
            t(zaman)=zaman;
            lq(zaman)=bekleyen;
            l(zaman)=toplamMusteri;
            
            %Servis Bitis Zamani Geldiyse Doluluk Durumu Pasiflenir
            if (servisbitis == j)
            	doluluk = false;
            end
            
            %Musteri Geldiyse ve Sistem Doluysa Bekleyen Musteri Arttirilir
            if (geliszamani==j && doluluk==true)
            	bekleyen=bekleyen+1;
            end
            
            %Taksi Bos Ise ve Musterinin Gelis Zamani Sistem Zamanindan
            %Once ya da Esitse
            if ((j > geliszamani || j == geliszamani) && doluluk == false)
                    
                    %Taksi Dolu
                    doluluk = true;
                    
                    fprintf("%d. is gunu, %d. musteri alindi. ",i,siradaki);
                    
                    %Bekledigi Sure = Sistem Zamani - Gelis Zamani
                    bekleme = j - geliszamani;
                    fprintf("Bekledigi sure: %d\n",bekleme);
                    
                    %Siradaki Musterinin Servis Bitis Zamani Ve
                    %Sonraki Musterinin Gelis Zamani Belirlenir
                    siradaki=siradaki+1;
                    servisbitis = j + musteriServis(siradaki);
                    geliszamani = geliszamani + musteriVaris(siradaki);

                    %Bekleyen Sifirlanir
                    bekleyen=0;
                    
                    %Toplam Harcanan ve Toplam Beklenen Zaman Hesaplanir
                    harcananZaman = harcananZaman + bekleme + musteriServis(siradaki);
                    toplamBekleme = toplamBekleme + bekleme;
                    
                    
                    %Suanki Toplam Musteri ve Bekleme Suresi
                    %Cizdirilmek Uzere Diziye Eklenir
                    toplamMusteri=toplamMusteri+1;
                    m(toplamMusteri)=toplamMusteri;
                    b(toplamMusteri)=bekleme;
                    
            end
            
            %Cizdirilmek Icin Eger Taksi Dolu ise Diziye 1 Degilse 0 Atilir
            %Taksi Dolu ise Mesgul Olunan Zaman 1 Arttirilir
            if(doluluk==true)
                d(zaman)=1;
                taksiMesgul = taksiMesgul + 1;
            else
                d(zaman)=0;
            end
            
            %Toplam Zaman Arttirilir
            zaman=zaman+1;
            
        end %icteki for
    end %distaki for
    
    
    %Sonuclari hesaplama ve yazdirma
    dolulukOrani = (taksiMesgul / (gun*360)) * 100;
    ortalamaHarcanan = harcananZaman / toplamMusteri;
    ortalamabekleme = toplamBekleme / toplamMusteri;
    
    fprintf("\n----------SONUCLAR:----------\n");
    fprintf("Simule edilen zaman: %d is gunu, 09:00 - 15:00 arasi toplam %d dakika\n", gun , gun*360);
    fprintf("Sistemin doluluk orani: %% %f \n", dolulukOrani);
    fprintf("Toplam müþteri sayisi: %d\n", toplamMusteri);
    fprintf("Toplam taksi bekleme zamani: %d dk\n", toplamBekleme);
    fprintf("Ortalama taksi bekleme zamani: %f dk\n", ortalamabekleme);
    fprintf("Musterilerin sistemde ortalama harcadiklari zaman: %f dk\n", ortalamaHarcanan);
    
    %Grafikleri cizme islemleri
    subplot(2,2,1);
    area(t,lq);
    title ( ' Zamana Göre Bekleyen Müþteri Sayýsý (LQ(t)) ' );
    xlabel ( ' Zaman (Dakika) ' );
    ylabel ( ' Bekleyen Müþteri ' );
    hold on
    subplot(2,2,2);
    plot(t,l);
    title ( ' Zamana Göre  Müþteri Sayýsý L(t) ' );
    xlabel ( ' Zaman (Dakika) ' );
    ylabel ( ' Müþteri Sayisi ' );
    hold on
    subplot(2,2,3);
    scatter(m,b,50,'filled');
    title ( ' Müþterilerin Bekleme Süresi ' );
    xlabel ( ' Müþteri ' );
    ylabel ( ' Bekleme Süresi ' );
    hold on
    subplot(2,2,4);
    area(t,d);
    title ( ' Zamana Göre Sistem Doluluðu ' );
    xlabel ( ' Zaman (Dakika) ' );
    ylabel ( ' Doluluk ' );
end