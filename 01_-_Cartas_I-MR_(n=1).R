#carregando pacotes:
library(qcc)
library(SixSigma)

#criando objetos que recebe dados carregados de um arquivo:
databasebiscoito <- read.csv2("Database.Biscoito.csv")
databasebiscoito.n1 <- read.csv2("Database.Biscoito.Runs.n1.csv")

##############################################################################
#Cartas para o conjunto N1 (n=1)

#para temperatura 

#criando combinação de amplitude móvel
samov.temperatura.n1 <- cbind(databasebiscoito.n1$Temperatura.Massa..oC.[1:14], databasebiscoito.n1$Temperatura.Massa..oC.[2:15])
#criando objetos qcc para carta de controle I-MR 
xbar.one.temperatura.n1 <- qcc(databasebiscoito.n1$Temperatura.Massa..oC., type = "xbar.one")
mr.temperatura.n1 <- qcc(samov.temperatura.n1, type = "R")

#para peso cru 

#criando combinação de amplitude móvel
samov.peso_cru.n1 <- cbind(databasebiscoito.n1$Peso.Cru..g.[1:14], databasebiscoito.n1$Peso.Cru..g.[2:15])
#criando objetos qcc para carta de controle I-MR 
xbar.one.peso_cru.n1 <- qcc(databasebiscoito.n1$Peso.Cru..g., type = "xbar.one")
mr.peso_cru.n1 <- qcc(samov.peso_cru.n1, type = "R")

#para peso assado 

#criando combinação de amplitude móvel
samov.peso_assado.n1 <- cbind(databasebiscoito.n1$Peso.Assado..g. [1:14], databasebiscoito.n1$Peso.Assado..g.[2:15])
#criando objetos qcc para carta de controle I-MR 
xbar.one.peso_assado.n1 <- qcc(databasebiscoito.n1$Peso.Assado..g., type = "xbar.one")
mr.peso_assado.n1 <- qcc(samov.peso_assado.n1, type = "R")

#para espessura 

#criando combinação de amplitude móvel
samov.espessura.n1 <- cbind(databasebiscoito.n1$ESPESSURA..mm.[1:14], databasebiscoito.n1$ESPESSURA..mm.[2:15])
#criando objetos qcc para carta de controle I-MR 
xbar.one.espessura.n1 <- qcc(databasebiscoito.n1$ESPESSURA..mm., type = "xbar.one")
mr.espessura.n1 <- qcc(samov.espessura.n1, type = "R")

#para comprimento 

#criando combinação de amplitude móvel
samov.comprimento.n1 <- cbind(databasebiscoito.n1$COMPRIMENTO..mm.[1:14], databasebiscoito.n1$COMPRIMENTO..mm.[2:15])
#criando objetos qcc para carta de controle I-MR 
xbar.one.comprimento.n1 <- qcc(databasebiscoito.n1$COMPRIMENTO..mm., type = "xbar.one")
mr.comprimento.n1 <- qcc(samov.comprimento.n1, type = "R")

#para largura 

#criando combinação de amplitude móvel
samov.largura.n1 <- cbind(databasebiscoito.n1$LARGURA..mm. [1:14], databasebiscoito.n1$LARGURA..mm.[2:15])
#criando objetos qcc para carta de controle I-MR 
xbar.one.largura.n1 <- qcc(databasebiscoito.n1$LARGURA..mm., type = "xbar.one")
mr.largura.n1 <- qcc(samov.largura.n1, type = "R")

##############################################################################
#Cartas para o conjunto de toda a base de dados

#para temperatura 

#criando combinação de amplitude móvel
samov.temperatura <- cbind(databasebiscoito$Temperatura.Massa..ºC.[1:117], databasebiscoito$Temperatura.Massa..ºC.[2:118])
#criando objetos qcc para carta de controle I-MR 
xbar.one.temperatura <- qcc(databasebiscoito$Temperatura.Massa..ºC., type = "xbar.one")
mr.temperatura <- qcc(samov.temperatura, type = "R")

#para peso cru 

#criando combinação de amplitude móvel
samov.peso_cru <- cbind(databasebiscoito$Peso.Cru..g.[1:117], databasebiscoito$Peso.Cru..g.[2:118])
#criando objetos qcc para carta de controle I-MR 
xbar.one.peso_cru <- qcc(databasebiscoito$Peso.Cru..g., type = "xbar.one")
mr.peso_cru <- qcc(samov.peso_cru, type = "R")

#para peso assado 

#criando combinação de amplitude móvel
samov.peso_assado <- cbind(databasebiscoito$Peso.Assado..g. [1:117], databasebiscoito$Peso.Assado..g.[2:118])
#criando objetos qcc para carta de controle I-MR 
xbar.one.peso_assado <- qcc(databasebiscoito$Peso.Assado..g., type = "xbar.one")
mr.peso_assado <- qcc(samov.peso_assado, type = "R")

#para espessura 

#criando combinação de amplitude móvel
samov.espessura <- cbind(databasebiscoito$ESPESSURA..mm.[1:117], databasebiscoito$ESPESSURA..mm.[2:118])
#criando objetos qcc para carta de controle I-MR 
xbar.one.espessura <- qcc(databasebiscoito$ESPESSURA..mm., type = "xbar.one")
mr.espessura <- qcc(samov.espessura, type = "R")

#para comprimento 

#criando combinação de amplitude móvel
samov.comprimento <- cbind(databasebiscoito$COMPRIMENTO..mm.[1:117], databasebiscoito$COMPRIMENTO..mm.[2:118])
#criando objetos qcc para carta de controle I-MR 
xbar.one.comprimento <- qcc(databasebiscoito$COMPRIMENTO..mm., type = "xbar.one")
mr.comprimento <- qcc(samov.comprimento, type = "R")

#para largura 

#criando combinação de amplitude móvel
samov.largura <- cbind(databasebiscoito$LARGURA..mm. [1:117], databasebiscoito$LARGURA..mm.[2:118])
#criando objetos qcc para carta de controle I-MR 
xbar.one.largura <- qcc(databasebiscoito$LARGURA..mm., type = "xbar.one")
mr.largura <- qcc(samov.largura, type = "R")