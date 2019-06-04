function FixChoosen()# secileni atla
    kazanc2=[i=0 for i=1:nodSayisi]
    kazanc2=CalcGainToArray(nodNet)
    for j=1:length(temp) # fix choosen -50 en kucuk deger olarak yazildi
        if temp[j]!=0
            kazanc2[temp[j]]=-50
        end
    end
    return kazanc2
end
