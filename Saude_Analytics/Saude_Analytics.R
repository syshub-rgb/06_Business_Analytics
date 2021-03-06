# Projeto Acad�mico - Data Science Academy
# https://www.datascienceacademy.com.br

# Health Analytics

# Projeto - Podemos Prever o Tempo de Sobreviv�ncia dos Pacientes 1 Ano Ap�s Receberem um Transplante?

# Diret�rio de trabalho

setwd("D:/R_Scripts/Projetos_Business_Analytics/HealthAnalytics")
getwd()



# Pacotes
library(dplyr)
library(ggcorrplot)
library(forecast)
library(nnet)
library(neuralnet)

# Carregando os Dados

dados <- read.csv("dados/dataset.csv", header = TRUE, na.strings = c(""))
dim(dados)


# Visualiza��o dos Dados
View(dados)


# Tipos de Dados
str(dados)

# Explorando os dados das vari�veis num�ricas
hist(dados$AGE)
hist(dados$AGE_DON)
hist(dados$PTIME)

 
hist(dados$FINAL_MELD_SCORE)

# Explorando os dados das vari�veis categ�ricas
dados$DIAB <- as.factor(dados.$DIAB)
table(dados$DIAB)

dados$PSTATUS <- as.factor(dados$PSTATUS)
table(dados$PSTATUS)


dados$GENDER <- as.factor(dados$GENDER)
dados$GENDER_DON <- as.factor(dados$GENDER_DON)
table(dados$GENDER)
table(dados$GENDER_DON)

dados$REGION <- as.factor(dados$REGION)
table(dados$REGION)


dados$TX_Year <- as.factor(dados$TX_Year)
table(dados$TX_Year)


dados$MALIG <- as.factor(dados$MALIG)
table(dados$MALIG)


dados$HIST_CANCER_DON <- as.factor(dados$HIST_CANCER_DON)
table(dados$HIST_CANCER_DON)


# Considerando apenas os pacientes que sobreviveram ao primeiro ano de cirurgia
# Para o erro n�o foi poss�vel encontrar a fun��o "%>%"
# Instalar os pacotes abaixo

install.packages("magrittr")
install.packages("knitr")
remove.packages("dplyr")
install.packages("dplyr") 
library(magrittr)
library(dplyr) 
library(knitr) 


dados1 <- dados %>%
  filter(PTIME > 365) %>%
  mutate(PTIME = (PTIME - 365))

dim(dados1)


# Dos pacientes que sobreviveram ao primeiro ano da cirurgia,
# filtramos os que permaneceram vivos por at� tr�s anos depois da cirurgia.
dados2 <- dados1 %>%
  
  

# Vamos separar vari�veis num�ricas e categ�ricas
# para vari�veis categoricas usamos associa��o



# O RESTANTE DO C�DIGO EST� DENTRO DO MEU HD.


dados_fator <- dados2[,unlist(lapply(dados2, is.factor))]



# Correla��o entre as vari�veis num�ricas
# Para vari�veis categ�ricas usamos associa��o



# Padroniza��o das vari�veis num�ricas e combina��o em um novo dataframe 
# com as vari�veis categ�ricas

# Padroniza��o



# Divis�o dos dados em treino e teste
set.seed(1)

?neuralnet
modelo_v2 <- neuralnet::neuralnet(PTIME ~ ., 
                                  data = dados_treino2, 
                                  linear.output = TRUE,
                                  hidden = 2,
                                  stepmax = 1e7)

# Plot
plot(modelo_v2,
     col.entry.synapse = "red", 
     col.entry = "brown",
     col.hidden = "green", 
     col.hidden.synapse = "black",
     col.out = "yellow", 
     col.out.synapse = "purple",
     col.intercept = "green", 
     fontsize = 10,
     show.weights = TRUE ,
     rep = "best")

# Avalia��o do modelo

# Com dados de treino
modelo_v2_pred_1 <- compute(modelo_v2, dados_treino2)
accuracy(unlist(modelo_v2_pred_1), dados_treino2$PTIME)

# Com dados de teste
modelo_v2_pred_2 <- compute(modelo_v2, dados_teste2)
accuracy(unlist(modelo_v2_pred_2), dados_teste2$PTIME)

# Conclus�o: O modelo de regress�o linear apresentou uma taxa de erro menor e, portanto, 
# deve ser usado como vers�o final.

# Sim, conseguimos prever o tempo de sobreviv�ncia dos pacientes 1 ano ap�s receberem um transplante.

# Fim




















































