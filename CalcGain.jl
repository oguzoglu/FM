function CalcGain(MyNode) #[1 0 0] gibi olan nodu netlerini belirterek kazanc hesaplar
    BlunanNodes=[0,0]
        FC=0
        TE=0
        for j=1:3
            if MyNode[j]!=0
                BlunanNodes=findNodesOfNet(MyNode[j])
                yeniBulunan=ThisNetNodesInWhichPart(BlunanNodes)
                alanfirst=yeniBulunan[1]
                alansecond=yeniBulunan[2]
                if alanfirst==alansecond
                    TE=TE+1
                else
                    FC=FC+1
                end
            end
        end
    return FC-TE
end
