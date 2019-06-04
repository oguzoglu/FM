function CalcGainToArray(nodeNetArray) # butun nodlarin kazancini bulur
    resultArray=[i=0 for i=1:nodSayisi]
    temp=[0,0,0]
    for i=1:nodSayisi
        for j=1:3
            temp[j]=nodeNetArray[i,j]
        end
        resultArray[i]=CalcGain(temp)
    end
    return resultArray
end
