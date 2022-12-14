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

##################################################################################
#PCA para base de dados inteira

databasebiscoito_nums <- as.matrix(databasebiscoito[,3:8])

#Obter autovalores e autovetores
eigen(covariance(databasebiscoito_nums))

#resumo dos componentes principais
summary(prcomp(databasebiscoito_nums))

#complementando a an?lise de forma gr?fica usando um gr?fico de Pareto elementar:
#Primeiro, obtendo a variancia por meio do desvio padr?o dos componentes:
varian <- (prcomp(databasebiscoito_nums)$sdev)^2

#armazenando a propor??o da variancia e a propor??o cumulativa:
perc <- varian/sum(varian)
cumperc <- cumsum(perc)

#tra?ando a propor??o cumulativa como:
plot(cumperc, type = "o", xlim = c(0.5, length(cumperc) + 0.5), 
     ylim = c(0,1),xlab = "component", ylab = "percent")
#E adicionando o gr?fico de barras
barplot(perc, add = TRUE, width = 1, beside = TRUE, col = "gray", 
        space = c(0.5,0,0,0,0,0))

#Os dois primeiros componentes s?o respons?veis por 
#92,66% da variabilidade
#Portanto, a dimens?o original do problema foi reduzida a um 
#problema bidimensional usando
prcomp(databasebiscoito_nums)$x 
#ou
predict(prcomp(databasebiscoito_nums))
#O R induz os dados das pontua??es dos componentes principais

#Assumindo que os par?metros s?o desconhecidos ser? 
#executada uma elipse de controle F e um gr?fico de controle T2.
#Elipse de confian?a F:
a <- predict(prcomp(databasebiscoito_nums))[,1:2]
S <- covariance(a)
Xmv <- colMeans(a)
plot(ellip(type="t2", a, alpha = 0.01),type="l", xlim = c(-10,10), 
     ylim = c(-6,6), xlab="z1", ylab="z2")
#centro:
points(Xmv [1], Xmv [2], pch = 3)
#adicionando pontos a elipse:
points(a, cex = 0.75)

#Carta Hotelling T2 para os dois primeiros componentes principais
mult.chart(a, type = "t2", alpha = 0.01)