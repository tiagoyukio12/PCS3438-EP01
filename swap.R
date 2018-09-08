swap <- function(rota, i, j, matAdj) {
    novaRota <- rota
    for (k in i:j) {
        novaRota[k] <- rota[j + i - k]
    }
    return(novaRota)
}