#carregando pacotes:
library(qcc)
library(SixSigma)

#Carta selecionada: c - número de não conformidades por amostra de biscoito
#Isto é, quantidade de vezes que um biscoito está fora de um dos limites de 
#especificação, por amostra
#5 oportunidades de não conformidades 

#criando objetos que recebe dados carregados de um arquivo:
databasebiscoito <- read.csv2("Database.Biscoito.csv")
limites.especificacao <-read.csv2("Limites.de.Especificacao.csv")

################################################################################
#Carta c para o conjunto de toda a base de dados

#Comparando cada observação de cada variável com seu respectivo limite de 
#controle, incrementando cada não conformidade e alocando em uma coluna 
databasebiscoito$nao.conformidades = 0
for (i in 1:118) {
  if(databasebiscoito$Peso.Cru..g.[i] < limites.especificacao$Limite.Inferior.de.Especificação[1] | 
     databasebiscoito$Peso.Cru..g.[i] > limites.especificacao$Limite.Superior.de.Especificação[1])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$Peso.Assado..g.[i] < limites.especificacao$Limite.Inferior.de.Especificação[2] | 
     databasebiscoito$Peso.Assado..g.[i] > limites.especificacao$Limite.Superior.de.Especificação[2])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$ESPESSURA..mm.[i] < limites.especificacao$Limite.Inferior.de.Especificação[3] | 
     databasebiscoito$ESPESSURA..mm.[i] > limites.especificacao$Limite.Superior.de.Especificação[3])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$COMPRIMENTO..mm.[i] < limites.especificacao$Limite.Inferior.de.Especificação[4] | 
     databasebiscoito$COMPRIMENTO..mm.[i] > limites.especificacao$Limite.Superior.de.Especificação[4])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$LARGURA..mm.[i] < limites.especificacao$Limite.Inferior.de.Especificação[5] | 
     databasebiscoito$LARGURA..mm.[i] > limites.especificacao$Limite.Superior.de.Especificação[5])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  
  #Removendo os zeros
  if(databasebiscoito$nao.conformidades[i] == 0)
  {databasebiscoito$nao.conformidades[i] <- NA
  }
}

#criando o objeto qcc para a carta c
nao.conformidades.total <- databasebiscoito$nao.conformidades[
  !is.na(databasebiscoito$nao.conformidades)]
base.inteira.c <- qcc(data = nao.conformidades.total, type = "c")