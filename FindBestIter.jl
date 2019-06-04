function FindBestIter(p2) # en iyi iterasyonu bulmak
    iter=-5
    CounNode=0
    countdizi=[i=0 for i=1:length(p2) ]
    if length(p2)==1
        iter=p2
    else
        roundme=round(nodSayisi/2)
        for i=1:length(p2)
            for j=1:nodSayisi-1
                pow=newalanA[p2[i],j]
                if pow!=0
                    CounNode+=1
                end
            end
            if CounNode>roundme
                countdizi[i]=0
            else
                countdizi[i]=CounNode
            end
        end
        cctv=findmax(countdizi)
        iter=p2[cctv[2]]
    end
    return iter
end
