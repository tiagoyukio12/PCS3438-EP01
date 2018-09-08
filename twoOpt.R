twoOpt <- function(rota, matAdj) {
    source('D:/las_descargas/github-projects/PCS3438-EP1/swap.R')

    improvement <- 0
    rotaAtual <- rota
    custoAtual <- calcCusto(rotaAtual, matAdj)

    while (improvement > 0) {
        recomeca = 0
        for (i in 2:(ncol(matAdj) - 1)) {
            for (j in (i + 1):(ncol(matAdj) - 1)) {
                novaRota <- swap(rotaAtual, i, j, matAdj)
                novoCusto <- calcCusto(novaRota, matAdj)
                if (novoCusto < custoAtual) {
                    recomeca = 1
                    improvement <- custoAtual - novoCusto
                    break
                }
            }
            if (recomeca == 1)
                break
        }
    }
    return(novaRota)
}