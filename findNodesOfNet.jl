function findNodesOfNet(y) # findNodesOfNet(5)= 2 4  sirasina gore dizilmis net'in nodlarini bulur
    BlunanNodes=[0,0]
    counter=1
    for i=1:netsaysisi
        if y==i
            for j=1:2
                BlunanNodes[counter]=net[i,j]
                counter=counter+1
            end
        end
    end
    return BlunanNodes
end
