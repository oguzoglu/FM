using Statistics
using Printf
path = "C:/13253813_omer_mustafa_oguzoglu/kod"
include(joinpath(path,"CalcGain.jl"))
include(joinpath(path,"CalcGainToArray.jl"))
include(joinpath(path,"FindNetsOfNode.jl"))
include(joinpath(path,"findNodesOfNet.jl"))
include(joinpath(path,"FixChoosen.jl"))
include(joinpath(path,"ThisNetNodesInWhichPart.jl"))
include(joinpath(path,"ThisNodeInWhichPart.jl"))
include(joinpath(path,"moveToOtherPart.jl"))
include(joinpath(path,"FindBestIter.jl"))
nodSayisi=7# kose sayisini belirle
netsaysisi=9
###### her net(ağ) sadece iki nokta arasinda olmak zorunda
net=[
[1 3];# net1
[1 4];# net2
[1 5];# net3
[2 4];# net4
[2 5];# net5
[2 6];# net6
[5 6];# net7
[3 4];# net8
[6 7]]# net9
###### her nodda(kose noktasi) en fazla 3 net olabilir 0 sayisi node olmadigini temsil ediyor
nodNet=[
[1 2 3];#node1
[4 5 6];#node2
[1 8 0];#node3
[2 4 8];#node4
[3 5 7];#node5
[6 7 9];#node6
[9 0 0]]#node7
alanA=[1,2]
alanB=[3,4,5,6,7]
pam=0
kazancGercek=[i=0 for i=1:nodSayisi]# asil kazanc
Gm=[i=0 for i=1:nodSayisi] #komulatif kazanci hesaplamak icin
temp=[i=0 for i=1:nodSayisi]
maxGm=[i=0 for i=1:nodSayisi] # tasinanin degeri
newalanA=zeros(Int64,nodSayisi,nodSayisi-1)
newalanB=zeros(Int64,nodSayisi,nodSayisi-1)
for i=1:nodSayisi-1-length(alanA)# nodSayisi-1 olmak zorunda taşma durumu denge ihlalini gösterir
    push!(alanA,0) #nodSayisi-1 olana kadar 0 push yapmak
end
for i=1:nodSayisi-1-length(alanB)# nodSayisi-1 olmak zorunda taşma durumu denge ihlalini gösterir
    push!(alanB,0)
end
# algoritmanin islemesi
boyut=nodSayisi
for i=1:boyut
    kazanc=FixChoosen() # fix choosed
    maxMatrix=findmax(kazanc)
    maxDegeri=maxMatrix[1]
    maxindex=maxMatrix[2]
    kazancGercek=CalcGainToArray(nodNet) #kazanc hesapla
    maxMatrix=findmax(kazancGercek)
    maxDegeri2=maxMatrix[1]
    maxindex2=maxMatrix[2]
    print("kazanc: ")
    println(kazancGercek)
    pam=moveToOtherPart(maxindex) #diger alana tasi
    if i==1
        Gm[1]=maxDegeri
    else
        Gm[i]=maxDegeri+Gm[i-1]
    end
    if pam==1
        temp[i]=maxindex
        maxGm[i]=maxDegeri
    else # denge ihlali olursa (0 ihlal durumu)
        print(i)
        println(".iterasyonda da denge ihlali tespiti")
        println("")
        print("Diger maksimum kazanc degeri=:")
        pam=moveToOtherPart(maxindex)
        kazanc=FixChoosen()
        kazanc[maxindex]=-50
        maxMatrix=findmax(kazanc)
        maxDegeri=maxMatrix[1]
        maxindex=maxMatrix[2]
        temp[i]=maxindex
        maxGm[i]=maxDegeri
        Gm[i]=maxDegeri+Gm[i-1]
        print(maxDegeri)
        print(", indexi=:")
        println(maxindex)
        pam=moveToOtherPart(maxindex)
        temp[i]=maxindex
    end
    for j=1:length(alanA)
        newalanA[i,j]=alanA[j]
        newalanB[i,j]=alanB[j]
    end
    print(i)
    print(".iterasyonda da alan A= ")
    print("{")
    for k=1:length(alanA)
        if alanA[k]!=0
            print(" ")
            print(alanA[k])
            print(" ")
        end
    end
    print("}")
    print(" ve alan B= ")
    print("{")
    for k=1:length(alanB)
        if alanB[k]!=0
            print(" ")
            print(alanB[k])
            print(" ")
        end
    end
    print("}")
    println()
    println()
end
maxval = maximum(Gm)
positions = [i for (i, x) in enumerate(Gm) if x == maxval] #Gm deki maksimum olanlarin indexlerini veriri
bestIteration=FindBestIter(positions)
println("Komulatif kazanc degeri:")
for i=1:length(Gm)
    print("G")
    print(i)
    print("= ")
    println(Gm[i])
end
println("Dengeli durumda olma sartiyla maximum kazanc:s")
for i=1:length(maxGm)
    print("Iterasyon")
    print(i)
    print("= ")
    println(maxGm[i])
end
print("en iyi iterasyon=  ")
println(bestIteration)
print("En iyi alan A dagilimi=  ")
for i=1:size(newalanA)[2]
        print(newalanA[bestIteration,i])
        print(" ")
end
println(" ")
print("En iyi alan B dagilimi=  ")
for i=1:size(newalanB)[2]
        print(newalanB[bestIteration,i])
        print(" ")
end
println()
