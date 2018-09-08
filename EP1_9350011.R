EP1_9350011 <- function(arqEntrada, arqSaida) {
    source('D:/las_descargas/github-projects/PCS3438-EP1/vizProx.R')
    source('D:/las_descargas/github-projects/PCS3438-EP1/calcCusto.R')

    tInicial <- Sys.time()

    # EP1_9350011('D:/las_descargas/github-projects/PCS3438-EP1/entrada.csv','D:/las_descargas/github-projects/PCS3438-EP1/saida.csv')
    matAdj <- as.matrix(read.table(arqEntrada, sep = ',', header=TRUE))

    # Algoritmo Nearest Neighbour
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



    # Imprime resultado e salva no arquivo de saida
    tExec <- Sys.time() - tInicial
    cat("Custo: ", menorCusto, "\n Tempo de Execucao: ", tExec, "\n Rota: ", melhorRota, "\n")
    resultado <- c(menorCusto, tExec, melhorRota)
    write.table(resultado, file = arqSaida, sep = ",", row.names = FALSE, col.names = FALSE)
}