#carregando pacotes:
library(qcc)
library(SixSigma)
library(MSQC)

#criando objetos que recebe dados carregados de um arquivo:
databasebiscoito <- read.csv2("Database.Biscoito.csv")
databasebiscoito.n1 <- read.csv2("Database.Biscoito.Runs.n1.csv")
databasebiscoito.n2 <- read.csv2("Database.Biscoito.Runs.n2.csv")
databasebiscoito.n3 <- read.csv2("Database.Biscoito.Runs.n3.csv")

###################################################################
#Matriz de Correlação para o conjunto de toda a base de dados

databasebiscoito_nums <- as.matrix(databasebiscoito[,3:8])

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor)
}

pairs(databasebiscoito_nums, upper.panel = panel.cor)

####################################################################
#Matriz de Correlação apenas para amostras de tamanho 1 (n=1)

databasebiscoito_nums_n1 <- as.matrix(databasebiscoito.n1[,3:8])

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor)
}

ab <- pairs(databasebiscoito_nums_n1, upper.panel = panel.cor)

###################################################################
#Teste de normalidade

shapiro.test(databasebiscoito$Temperatura.Massa..ºC.)
shapiro.test(databasebiscoito$Peso.Cru..g.)
shapiro.test(databasebiscoito$Peso.Assado..g.)
shapiro.test(databasebiscoito$ESPESSURA..mm.)
shapiro.test(databasebiscoito$COMPRIMENTO..mm.)
shapiro.test(databasebiscoito$LARGURA..mm.)

shapiro.test(databasebiscoito.n1$Temperatura.Massa..oC.)
shapiro.test(databasebiscoito.n1$Peso.Cru..g.)
shapiro.test(databasebiscoito.n1$Peso.Assado..g.)
shapiro.test(databasebiscoito.n1$ESPESSURA..mm.)
shapiro.test(databasebiscoito.n1$COMPRIMENTO..mm.)
shapiro.test(databasebiscoito.n1$LARGURA..mm.)

shapiro.test(databasebiscoito.n2$Temperatura.Massa..oC.)
shapiro.test(databasebiscoito.n2$Peso.Cru..g.)
shapiro.test(databasebiscoito.n2$Peso.Assado..g.)
shapiro.test(databasebiscoito.n2$ESPESSURA..mm.)
shapiro.test(databasebiscoito.n2$COMPRIMENTO..mm.)
shapiro.test(databasebiscoito.n2$LARGURA..mm.)

shapiro.test(databasebiscoito.n3$Temperatura.Massa..oC.)
shapiro.test(databasebiscoito.n3$Peso.Cru..g.)
shapiro.test(databasebiscoito.n3$Peso.Assado..g.)
shapiro.test(databasebiscoito.n3$ESPESSURA..mm.)
shapiro.test(databasebiscoito.n3$COMPRIMENTO..mm.)
shapiro.test(databasebiscoito.n3$LARGURA..mm.)
