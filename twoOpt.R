twoOpt <- function(rota, matAdj) {
    source('./swap.R')
    source('./calcCusto.R')
    
    # Verifica se rota foi reduzida desde a ultima iteracao
    reduziuRota <- TRUE

    # Variaveis necessarias para a condicao de parada por tempo ou melhora do custo
    tInicial <- Sys.time()
    custoInicial <- calcCusto(rota, matAdj)

    rotaAtual <- rota
    custoAtual <- calcCusto(rotaAtual, matAdj)

    while (reduziuRota) {
        reduziuRota <- FALSE

        # Verifica todas as rotas candidatas a serem invertidas
        # Desconsidera a primeira (1) e a ultima (ncol(matAdj)) cidade por serem fixas
        for (i in 2:(ncol(matAdj) - 2)) {
            for (j in (i + 1):(ncol(matAdj) - 1)) {
                # Inverte o caminho de i -> j da rota atual para j -> i
                novaRota <- swap(rotaAtual, i, j)
                novoCusto <- calcCusto(novaRota, matAdj)
                if (novoCusto < custoAtual) {
                    # Se reduziu o custo, reinicia o processo
                    rotaAtual <- novaRota
                    custoAtual <- novoCusto
                    reduziuRota <- TRUE
                    break
                }
            }
            if (reduziuRota)
                break
        }
        # Termina algoritmo se melhora do custo ou tempo forem maiores que os permitidos,
        # ou se nenhuma reducao de rota for encontrada
        if (custoInicial - custoAtual > 0.25 * custoAtual || Sys.time() - tInicial > 50)
            break
    }
    return(rotaAtual)
}