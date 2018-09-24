size <- 250

mat <- matrix(0, size, size)
colnames(mat) <- colnames(mat, do.NULL = FALSE, prefix = "Cidade ")
rownames(mat) <- rownames(mat, do.NULL = FALSE, prefix = "Cidade ")

for (i in 1:size) {
    mat[i,] <- floor(runif(size, min=0, max=1000))
    mat[i,i] <- 0
}
for (i in 1:size) {
    for (j in 1:size)
        if (mat[i, j] > 750)
            mat[i, j] <- Inf
}

for (i in 1:size) {
    for (j in i:size) {
        mat[j, i] <- mat[i, j] 
    }
}

write.table(mat, file = './matrix.csv', sep = ",", row.names = TRUE, col.names = TRUE)

