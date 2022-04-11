function f=randomVaris()
    musteriVaris=[];
    for i = 1:15
        random=rand;
        if(0 < random && random <= 0.14) 
            musteriVaris(i)=30;
        elseif(0.14 < random && random <= 0.36) 
            musteriVaris(i)=35;
        elseif(0.36 < random && random <= 0.79) 
            musteriVaris(i)=40;
        elseif(0.79 < random && random <= 0.96) 
            musteriVaris(i)=45;
        elseif(0.96 < random && random <= 1)
            musteriVaris(i)=50;
        end
    end
f=musteriVaris;
end