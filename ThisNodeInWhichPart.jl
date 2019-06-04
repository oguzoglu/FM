
function ThisNodeInWhichPart(node) #kose noktasinin alanA daysa 1 alanB deyse 2 dondurur
    whichArea=0
    for i=1:length(alanA)
        if node==alanA[i]&&alanA[i]!=0
            whichArea=1
            break
        elseif node==alanB[i]alanB[i]!=0
            whichArea=2
        end
    end
    return whichArea
end
