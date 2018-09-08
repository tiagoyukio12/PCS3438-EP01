vizProx <- function(start, matViz, matAdj) {
    rota <- rep(-1, ncol(matAdj) + 1)
    visitado <- rep(0, ncol(matAdj))

    rota[1] <- start
    visitado[start] <- 1

    for (i in 1:ncol(matAdj)) {
        naMatViz <- rep(0, ncol(matViz))
        for (j in 1:ncol(matAdj)) {
            if (matViz[i, j] == -1) {
                # encontra j-esimo minimo
                min <- Inf
                iMin <- -1
                for (k in 1:ncol(matAdj)) {
                    if (matAdj[i, k] < min && !naMatViz[k]) {
                        min <- matAdj[i, k]
                        iMin <- k
                    }
                }
                # atualiza matriz de vizinhos mais proximos
                matViz[i, j] <- iMin
            }
            iVizProx <- matViz[i, j]
            naMatViz[iVizProx] <- 1
            if (!visitado[iVizProx]) {
                rota[i + 1] <- iVizProx
                visitado[iVizProx] <- 1
                break
            }
        }
    }

    rota[ncol(matAdj) + 1] <- start

    retList <- list("matViz" = matViz, "rota" = rota)
    return(retList)
}