size <- 500

mat <- matrix(0, size, size)
colnames(mat) <- colnames(mat, do.NULL = FALSE, prefix = "Cidade ")
rownames(mat) <- rownames(mat, do.NULL = FALSE, prefix = "Cidade ")

for (i in 1:size) {
    mat[i,] <- floor(runif(size, min=0, max=1000))
    mat[i,i] <- 0
}

for (i in 1:size) {
    for (j in i:size) {
        mat[j, i] <- mat[i, j] 
    }
}

write.table(mat, file = 'D:/las_descargas/github-projects/PCS3438-EP1/matrix.csv', sep = ",", row.names = TRUE, col.names = TRUE)