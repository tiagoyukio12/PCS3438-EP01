EP1_9350011 <- function(arqEntrada, arqSaida) {
    source('D:/las_descargas/github-projects/PCS3438-EP1/vizProx.R')
    source('D:/las_descargas/github-projects/PCS3438-EP1/calcCusto.R')
    source('D:/las_descargas/github-projects/PCS3438-EP1/twoOpt.R')

    tInicial <- Sys.time()

    matAdj <- as.matrix(read.table(arqEntrada, sep = ',', header=TRUE))

    ### Algoritmo Nearest Neighbour (NN)
    menorCusto <- Inf
    melhorRota <- -1;

    # Array contendo em (i,j) o j-esimo vizinho mais proximo da cidade i
    matViz <- matrix(-1, ncol(matAdj), ncol(matAdj))

    # Calcula a rota por NN iniciando em cada uma das cidades
    for (i in 1:ncol(matAdj)) {
        lista <- vizProx(i, matViz, matAdj)
        rota <- lista$rota
        matViz <- lista$matViz
        custo <- calcCusto(rota, matAdj)
        
        # Escolhe a menor rota dentre todas calculadas
        if (custo < menorCusto) {
            menorCusto <- custo
            melhorRota <- rota
        }
    }

    ### 2-opt
    melhorRota <- twoOpt(melhorRota, matAdj)
    menorCusto <- calcCusto(melhorRota, matAdj)

    ### Imprime resultado e salva no arquivo de saida
    tExec <- Sys.time() - tInicial
    cat("Custo: ", menorCusto, "\n Tempo de Execucao: ", tExec, "\n Rota: ", melhorRota, "\n")
    resultado <- c(menorCusto, tExec, melhorRota)
    write.table(resultado, file = arqSaida, sep = ",", row.names = FALSE, col.names = FALSE)
}