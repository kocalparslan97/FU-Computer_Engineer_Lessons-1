function f=randomServis()
    musteriServis=[];
    for i = 1:15
        random=rand;
        if(0 < random && random <= 0.12) 
            musteriServis(i)=20;
        elseif(0.12 < random && random <= 0.47) 
            musteriServis(i)=30;
        elseif(0.47 < random && random <= 0.90) 
            musteriServis(i)=40;
        elseif(0.90 < random && random <= 0.96) 
            musteriServis(i)=50;
        elseif(0.96 < random && random <= 1)
            musteriServis(i)=60;
        end
    end
f=musteriServis;
end