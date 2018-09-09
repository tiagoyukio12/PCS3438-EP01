twoOpt <- function(rota, matAdj) {
    source('D:/las_descargas/github-projects/PCS3438-EP1/swap.R')
    source('D:/las_descargas/github-projects/PCS3438-EP1/calcCusto.R')
    tInicial <- Sys.time()

    recomeca <- TRUE
    custoInicial <- calcCusto(rota, matAdj)
    rotaAtual <- rota
    custoAtual <- calcCusto(rotaAtual, matAdj)

    while (recomeca) {
        recomeca <- FALSE

        for (i in 2:(ncol(matAdj) - 2)) {
            for (j in (i + 1):(ncol(matAdj) - 1)) {
                novaRota <- swap(rotaAtual, i, j)
                novoCusto <- calcCusto(novaRota, matAdj)
                if (novoCusto < custoAtual) {
                    rotaAtual <- novaRota
                    custoAtual <- novoCusto
                    recomeca <- TRUE
                    break
                }
            }
            if (recomeca)
                break
        }
        if (custoInicial - custoAtual > 0.25 * custoAtual || Sys.time() - tInicial > 50)
            break
    }
    return(rotaAtual)
}