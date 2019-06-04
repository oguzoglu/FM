function moveToOtherPart(node) #bir node u diger parta tasimak dengesiz durumda 0 return eder dengeli durumda 1
    test=0
    Dengeli=0
    for i=1:length(alanA)
        if alanA[i]==node&&test!=2
            for j=1:length(alanB)
                if alanB[j]==0
                    alanB[j]=node
                    test=1
                    alanA[i]=0
                    if sum(alanA)==0
                        dengeli=-1
                    else
                        Dengeli=1
                    end
                    break
                end
            end
        elseif node==alanB[i]&&test==0
            for j=1:length(alanA)
                if alanA[j]==0
                    alanA[j]=node
                    test=2
                    alanB[i]=0
                    if sum(alanB)==0
                        dengeli=-1
                    else
                        Dengeli=1
                    end
                    break
                end
            end
        end
    end
    return Dengeli
end
