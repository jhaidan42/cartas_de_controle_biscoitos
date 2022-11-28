#carregando pacotes:
library(qcc)
library(SixSigma)

#criando objetos que recebe dados carregados de um arquivo:
databasebiscoito.n2 <- read.csv2("Database.Biscoito.Runs.n2.csv")
databasebiscoito.n3 <- read.csv2("Database.Biscoito.Runs.n3.csv")

#######################################################################
#Cartas de Controle para o conjunto N2 (n=2)

#para temperatura 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n2.temperatura <- qcc.groups(databasebiscoito.n2$Temperatura.Massa..oC., databasebiscoito.n2$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n2.temperatura <- qcc(amostras.n2.temperatura, type = "xbar")
#criando o objeto qcc, para carta de controle R
R.n2.temperatura <- qcc(amostras.n2.temperatura, type = "R")

#para peso cru 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n2.peso_cru <- qcc.groups(databasebiscoito.n2$Peso.Cru..g., databasebiscoito.n2$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n2.peso_cru <- qcc(amostras.n2.peso_cru, type = "xbar")
#criando o objeto qcc, para carta de controle R
R.n2.peso_cru <- qcc(amostras.n2.peso_cru, type = "R")

#para peso assado 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n2.peso_assado <- qcc.groups(databasebiscoito.n2$Peso.Assado..g., databasebiscoito.n2$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n2.peso_assado <- qcc(amostras.n2.peso_assado, type = "xbar")
#criando o objeto qcc, para carta de controle R
R.n2.peso_assado <- qcc(amostras.n2.peso_assado, type = "R")

#para espessura 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n2.espessura <- qcc.groups(databasebiscoito.n2$ESPESSURA..mm., databasebiscoito.n2$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n2.espessura <- qcc(amostras.n2.espessura, type = "xbar")
#criando o objeto qcc, para carta de controle R
S.n2.espessura <- qcc(amostras.n2.espessura, type = "R")

#para comprimento 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n2.comprimento <- qcc.groups(databasebiscoito.n2$COMPRIMENTO..mm., databasebiscoito.n2$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n2.comprimento <- qcc(amostras.n2.comprimento, type = "xbar")
#criando o objeto qcc, para carta de controle R
S.n2.comprimento <- qcc(amostras.n2.comprimento, type = "R")

#para largura 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n2.largura <- qcc.groups(databasebiscoito.n2$LARGURA..mm., databasebiscoito.n2$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n2.largura <- qcc(amostras.n2.largura, type = "xbar")
#criando o objeto qcc, para carta de controle R
S.n2.largura <- qcc(amostras.n2.largura, type = "R")

#######################################################################
#Cartas de Controle para o conjunto N3 (n=3)

#para temperatura

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n3.temperatura <- qcc.groups(databasebiscoito.n3$Temperatura.Massa..oC., databasebiscoito.n3$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n3.temperatura <- qcc(amostras.n3.temperatura, type = "xbar")
#criando o objeto qcc, para carta de controle R
S.n3.temperatura <- qcc(amostras.n3.temperatura, type = "R")

#para peso cru 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n3.peso_cru <- qcc.groups(databasebiscoito.n3$Peso.Cru..g., databasebiscoito.n3$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n3.peso_cru <- qcc(amostras.n3.peso_cru, type = "xbar")
#criando o objeto qcc, para carta de controle R
R.n3.peso_cru <- qcc(amostras.n3.peso_cru, type = "R")

#para peso assado 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n3.peso_assado <- qcc.groups(databasebiscoito.n3$Peso.Assado..g., databasebiscoito.n3$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n3.peso_assado <- qcc(amostras.n3.peso_assado, type = "xbar")
#criando o objeto qcc, para carta de controle R
R.n3.peso_assado <- qcc(amostras.n3.peso_assado, type = "R")

#para espessura 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n3.espessura <- qcc.groups(databasebiscoito.n3$ESPESSURA..mm., databasebiscoito.n3$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n3.espessura <- qcc(amostras.n3.espessura, type = "xbar")
#criando o objeto qcc, para carta de controle R
S.n3.espessura <- qcc(amostras.n3.espessura, type = "R")

#para comprimento 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n3.comprimento <- qcc.groups(databasebiscoito.n3$COMPRIMENTO..mm., databasebiscoito.n3$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n3.comprimento <- qcc(amostras.n3.comprimento, type = "xbar")
#criando o objeto qcc, para carta de controle R
S.n3.comprimento <- qcc(amostras.n3.comprimento, type = "R")

#para largura 

#organizando os dados em grupos de amostras para ser usado na função qcc
amostras.n3.largura <- qcc.groups(databasebiscoito.n3$LARGURA..mm., databasebiscoito.n3$LADO)
#criando o objeto qcc, para carta de controle X-Bar
xbar.n3.largura <- qcc(amostras.n3.largura, type = "xbar")
#criando o objeto qcc, para carta de controle R
S.n3.largura <- qcc(amostras.n3.largura, type = "R")