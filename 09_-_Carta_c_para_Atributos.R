#carregando pacotes:
library(qcc)
library(SixSigma)

#Carta selecionada: c - n?mero de n?o conformidades por amostra de biscoito
#Isto ?, quantidade de vezes que um biscoito est? fora de um dos limites de 
#especifica??o, por amostra
#5 oportunidades de n?o conformidades 

#criando objetos que recebe dados carregados de um arquivo:
databasebiscoito <- read.csv2("Database.Biscoito.csv")
limites.especificacao <-read.csv2("Limites.de.Especificacao.csv")

################################################################################
#Carta c para o conjunto de toda a base de dados

#Comparando cada observa??o de cada vari?vel com seu respectivo limite de 
#controle, incrementando cada n?o conformidade e alocando em uma coluna 
databasebiscoito$nao.conformidades = 0
for (i in 1:118) {
  if(databasebiscoito$Peso.Cru..g.[i] < limites.especificacao$Limite.Inferior.de.Especifica??o[1] | 
     databasebiscoito$Peso.Cru..g.[i] > limites.especificacao$Limite.Superior.de.Especifica??o[1])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$Peso.Assado..g.[i] < limites.especificacao$Limite.Inferior.de.Especifica??o[2] | 
     databasebiscoito$Peso.Assado..g.[i] > limites.especificacao$Limite.Superior.de.Especifica??o[2])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$ESPESSURA..mm.[i] < limites.especificacao$Limite.Inferior.de.Especifica??o[3] | 
     databasebiscoito$ESPESSURA..mm.[i] > limites.especificacao$Limite.Superior.de.Especifica??o[3])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$COMPRIMENTO..mm.[i] < limites.especificacao$Limite.Inferior.de.Especifica??o[4] | 
     databasebiscoito$COMPRIMENTO..mm.[i] > limites.especificacao$Limite.Superior.de.Especifica??o[4])
  {databasebiscoito$nao.conformidades[i] <- databasebiscoito$nao.conformidades[i]+1
  }
  if(databasebiscoito$LARGURA..mm.[i] < limites.especificacao$Limite.Inferior.de.Especifica??o[5] | 
     databasebiscoito$LARGURA..mm.[i] > limites.especificacao$Limite.Superior.de.Especifica??o[5])
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