calcCusto <- function(rota, matAdj) {
    custo <- 0
    for (i in 1:(length(rota) - 1)) {
        if (rota[i] == -1) {
            custo <- Inf
            break
        } else {
            custo <- custo + matAdj[rota[i], rota[i + 1]]
        }
    }
    return(custo)
}