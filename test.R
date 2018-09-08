source('D:/las_descargas/github-projects/PCS3438-EP1/vizProx.R')
source('D:/las_descargas/github-projects/PCS3438-EP1/calcCusto.R')

matAdj <- as.matrix(read.table('D:/las_descargas/github-projects/PCS3438-EP1/entrada.csv', sep = ',', header=TRUE))

matViz <- matrix(-1, ncol(matAdj), ncol(matAdj))
lista <- vizProx(1, matViz, matAdj)

print(lista$matViz)
print(lista$rota)

custo <- calcCusto(lista$rota, matAdj)

print(custo)