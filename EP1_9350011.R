EP1_9350011 <- function(arqEntrada, arqSaida) {
    source('D:/las_descargas/github-projects/PCS3438-EP1/vizProx.R')
    source('D:/las_descargas/github-projects/PCS3438-EP1/calcCusto.R')
    
    # EP1_9350011('D:/las_descargas/github-projects/PCS3438-EP1/entrada.csv','foo')
    matAdj <- as.matrix(read.table(arqEntrada, sep = ',', header=TRUE))

    # greedy algorithm
    menorCusto <- Inf
    melhorRota <- -1;
    matViz <- matrix(-1, ncol(matAdj), ncol(matAdj))
    for (i in 1:ncol(matAdj)) {
        lista <- vizProx(i, matViz, matAdj)
        rota <- lista$rota
        matViz <- lista$matViz
        custo <- calcCusto(rota, matAdj)

        if (custo < menorCusto) {
            menorCusto <- custo
            melhorRota <- rota
        }
    }

    # 2-opt



    # save file
    print(melhorRota)
    print(menorCusto)


}