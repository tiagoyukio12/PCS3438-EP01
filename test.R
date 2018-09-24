source('./vizProx.R')
source('./calcCusto.R')
source('./twoOpt.R')
source('./swap.R')

matAdj <- as.matrix(read.table('./formato.csv', sep = ',', header=TRUE))

matViz <- matrix(-1, ncol(matAdj), ncol(matAdj))

# nearest neighbour
lista <- vizProx(2, matViz, matAdj)
matViz <- lista$matViz
rota <- lista$rota
cat('Matriz de vizinhos mais proximos:\n')
print(matViz)
cat('Rota: ', rota, '\n')

# custo da rota
custo <- calcCusto(rota, matAdj)
cat('Custo: ', custo, '\n')

# troca de rotas
novaRota <- swap(rota, 2, 4)
cat('Nova rota: ', novaRota, '\n')

# 2-opt
rotaRuim <- c(2,4,1,3,2)
novaRota <- twoOpt(rotaRuim, matAdj)
cat('Nova rota: ', novaRota, '\n')
custo <- calcCusto(rota, matAdj)
cat('Custo: ', custo, '\n')