function findNetsOfNode(y)# findNetsOfNode(5)= 3 4 0 sirasina gore dizilmis nodun netlerini bulur
    BlunanNodes=[0,0,0]
    counter=1
    for i=1:nodSayisi
        if y==i
            for j=1:3
                BlunanNodes[counter]=nodNet[i,j]
                counter=counter+1
            end
        end
    end
    return BlunanNodes
end
