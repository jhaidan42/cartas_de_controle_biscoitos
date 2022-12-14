#carregando pacotes:
library(qcc)
library(SixSigma)
library(MSQC)

#criando objetos que recebe dados carregados de um arquivo:
databasebiscoito <- read.csv2("Database.Biscoito.csv")
databasebiscoito.n1 <- read.csv2("Database.Biscoito.Runs.n1.csv")
databasebiscoito.n2 <- read.csv2("Database.Biscoito.Runs.n2.csv")
databasebiscoito.n3 <- read.csv2("Database.Biscoito.Runs.n3.csv")

#As fun??es do pacote MSQC, para cartas de controle multivariadas, aceitam apenas 
#conjuntos de dados do tipo matrix ou array no R.
#Esses dois formatos s?o compostos apenas por dados do mesmo tipo, diferente do 
#formato data.frame, que ? o formato natural na leitura da nossa base de dados,
#e pode conter numeros, strings, caracteres etc.

###############################################################################
#Cartas Hotelling T2

###############################################################################
#carta Hotelling T2 para o conjunto de toda a base de dados
databasebiscoito_nums <- as.matrix(databasebiscoito[,3:8])
mult.chart(type = "t2", databasebiscoito_nums)

###############################################################################
#carta Hotelling T2 para o conjunto N1 (n=1)
databasebiscoito_nums_n1 <- as.matrix(databasebiscoito.n1[,3:8])
mult.chart(type = "t2", databasebiscoito_nums_n1)

###############################################################################
#A partir daqui os dados s?o em amostras de tamanhos maiores que 1 (n=2 e n=3).
#Ent?o n?o ? mais poss?vel que os dados estejam em uma matriz, e sim em um array.
#O array ? composto por linhas, colunas, e uma terceira dimens?o (como um cubo)
#as linhas do array ser?o as amostras, as colunas ser?o as vari?veis, 
#e a terceira dimens?o ser?o os grupos.
#Para que os nossos dados estejam nesse formato, foi necess?rio realizar 
#la?os de repeti??o no c?digo.

################################################################################
#Transformando os dados do conjunto N2 para array

#Criando 2 data frames (1 para cada n) que ser?o as 2 camadas da terceira 
#dimens?o do array
databasebiscoito_num_n2 <- databasebiscoito.n2[,3:8]

n1<-data.frame(array(dim=c(23,6)))
i<-1
j<-1
while (i<=23) {
  n1[i,] <- databasebiscoito_num_n2[j,]
  i<-i+1
  j<-j+2
}

n2<-data.frame(array(dim=c(23,6)))
i<-1
j<-2
while (i<=23) {
  n2[i,] <- databasebiscoito_num_n2[j,]
  i<-i+1
  j<-j+2
}

#Juntando as 2 camadas e formando o array
arraybiscoito_n2 <- array(c(unlist(n1),unlist(n2)), c(23,6,2), )
arraybiscoito_n2

#Executar a linha abaixo para apagar as vari?veis usadas na constru??o
rm(n1,n2,n3,i,j)

#################################################################################
#Transformando os dados do conjunto N3 para array

#Criando 3 data frames (1 para cada n) que ser?o as 3 camadas da terceira 
#dimens?o do array
databasebiscoito_num_n3 <- databasebiscoito.n3[,3:8]

n1<-data.frame(array(dim=c(19,6)))
i<-1
j<-1
while (i<=19) {
  n1[i,] <- databasebiscoito_num_n3[j,]
  i<-i+1
  j<-j+3
}

n2<-data.frame(array(dim=c(19,6)))
i<-1
j<-2
while (i<=19) {
  n2[i,] <- databasebiscoito_num_n3[j,]
  i<-i+1
  j<-j+3
}

n3<-data.frame(array(dim=c(19,6)))
i<-1
j<-3
while (i<=19) {
  n3[i,] <- databasebiscoito_num_n3[j,]
  i<-i+1
  j<-j+3
}

#Juntando as 3 camadas e formando o array
arraybiscoito_n3 <- array(c(unlist(n1),unlist(n2),unlist(n3)), c(19,6,3), )
arraybiscoito_n3

###############################################################################
#Agora com os arrays criados, podemos criar as cartas multivari?veis dos 
#conjuntos N2 e N3

###############################################################################
#Carta Hotelling T2 para o conjunto N2 (n=2):
mult.chart(type = "t2", arraybiscoito_n2)

###############################################################################
#Carta Hotelling T2 para o conjunto N3 (n=3):
mult.chart(type = "t2", arraybiscoito_n3)

###############################################################################
#Cartas MCUSUM

###############################################################################
#carta MCUSUM para o conjunto de toda a base de dados
mult.chart(type = "mcusum", databasebiscoito_nums)

###############################################################################
#carta MCUSUM para o conjunto N1 (n=1)
mult.chart(type = "mcusum", databasebiscoito_nums_n1)

###############################################################################
#Carta MCUSUM para o conjunto N2 (n=2):
mult.chart(type = "mcusum", arraybiscoito_n2)

###############################################################################
#Carta MCUSUM para o conjunto N3 (n=3):
mult.chart(type = "mcusum", arraybiscoito_n3)

###############################################################################
#Cartas MEWMA

###############################################################################
#carta MEWMA para o conjunto de toda a base de dados
mult.chart(type = "mewma", databasebiscoito_nums)

###############################################################################
#carta MEWMA para o conjunto N1 (n=1)
mult.chart(type = "mewma", databasebiscoito_nums_n1)

###############################################################################
#Carta MEWMA para o conjunto N2 (n=2):
mult.chart(type = "mewma", arraybiscoito_n2)

###############################################################################
#Carta MEWMA para o conjunto N3 (n=3):
mult.chart(type = "mewma", arraybiscoito_n3)