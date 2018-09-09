swap <- function(rota, i, j) {
    # Mantem o caminho de 1 -> (i - 1) e (j + 1) -> length(rota) intacto
    novaRota <- rota

    # Altera apenas o caminho de i -> j
    for (k in i:j) {
        novaRota[k] <- rota[j + i - k]
    }
    return(novaRota)
}