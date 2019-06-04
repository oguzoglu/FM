function ThisNetNodesInWhichPart(x)# eger alanA daysa 1 yazar değilse aynısı kalır
    y=[false,false]
    for i=1:2
        for j=1:length(alanA)
            if x[i]==alanA[j]
                y[i]=true
            end
        end
    end
    return y
end
