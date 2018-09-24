vizProx <- function(start, matViz, matAdj) {
    # Array contendo todas as cidades visitadas
    rota <- rep(-1, ncol(matAdj) + 1)
    
    # Array indicando os indices das cidades visitadas
    visitado <- rep(0, ncol(matAdj))

    rota[1] <- start
    visitado[start] <- 1

    for (i in 1:(ncol(matAdj) - 1)) {
        # Calcula qual sera a (i + 1)-esima cidade a ser visitada
        atual <- rota[i]

        # Array indicando se cidade j ja esta na matViz da cidade i
        naMatViz <- rep(0, ncol(matViz))

        for (j in 1:ncol(matAdj)) {
            if (matViz[atual, j] == -1) {
                # Encontra j-esimo minimo
                min <- Inf
                iMin <- -2
                for (k in 1:ncol(matAdj)) {
                    if (matAdj[atual, k] < min && !naMatViz[k]) {
                        min <- matAdj[atual, k]
                        iMin <- k
                    }
                }
                # Atualiza matriz de vizinhos mais proximos
                matViz[atual, j] <- iMin
            }
            iVizProx <- matViz[atual, j]
            if (iVizProx == -2) {
                # Nao foi encontrado caminho possivel
                retList <- list("matViz" = matViz, "rota" = rota)
                return(retList)
            }
            naMatViz[iVizProx] <- 1
            # Verifica se j-esimo minimo ja foi visitado
            if (!visitado[iVizProx]) {
                # Adiciona cidade j e reinicia processo para i++
                rota[i + 1] <- iVizProx
                visitado[iVizProx] <- 1
                break
            }
        }
    }
    rota[ncol(matAdj) + 1] <- start

    # Retorna a matriz de vizinhos mais proximos atualizada e a rota encontrada
    retList <- list("matViz" = matViz, "rota" = rota)
    return(retList)
}