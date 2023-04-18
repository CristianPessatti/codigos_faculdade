data <- c(13,16,27,28,25,19,28,20,21,27,29,12,11,11,28,21,29,16,22,12)

#Média
mean(data)
#Variância
var(data)

#Criando os intervalos
intervals <- seq(10, 30, by = 2)
#Classificando cada dado dentro de seu respectivo intervalo
data_intervals <- cut(data, breaks = intervals, right=FALSE, include.lowest = TRUE)
#Por padrão essa função considera os intervalos fechados à direita, por isso right=FALSE
#o include.lowest=TRUE faz com que o ultimo valor seja incluso

#Tabela de Frequência
freq <- table(data_intervals)

#Tabela de Frequência percentual
percent <- freq / length(data) * 100

#Criando o histograma
freq <- hist(data, breaks = seq(9,29,by=2),main="Relative Frequency Histogram", xlab="Data", ylab="Relative Frequency", freq=FALSE, col='steelblue')
#Transformando o eixo y em porcentagem
freq$counts <- freq$counts/sum(freq$counts)*100
#Excluindo os eixos do gráfico para poder recriá-los
plot(freq, yaxt="n", xaxt='n')
#Recriando eixo x
axis(1, at=seq(10,30, by=2), labels=paste0(seq(10,30, by=2)))
#Recriando eixo y
axis(2, at=seq(0, 25, by=5), labels=paste0(seq(0, 25, by=5), "%"))

#Combinações para ver o número de amostras em cada caso
choose(20,2)
choose(20,3)
choose(20,4)

#Média das médias para n = 2
comb.2 <- combn(data, 2)
means.2 <- apply(comb.2, 2, mean)
mean(means.2)

#Média das médias para n = 3
comb.3 <- combn(data, 3)
means.3 <- apply(comb.3, 2, mean)
mean(means.3)

#Média das médias para n = 4
comb.4 <- combn(data, 4)
means.4 <- apply(comb.4, 2, mean)
mean(means.4)

#Média das variâncias para n = 2
comb.v2 <- combn(data, 2)
vars.2 <- apply(comb.v2, 2, var)
mean(vars.2)

#Média das variâncias para n = 3
comb.v3 <- combn(data, 3)
vars.3 <- apply(comb, 2, var)
mean(vars.3)

#Média das variâncias para n = 4
comb.v4 <- combn(data, 4)
vars.4 <- apply(comb, 2, var)
mean(vars.4)

#Menores médias
min(means.2)
min(means.3)
min(means.4)

#Maiores médias
max(means.2)
max(means.3)
max(means.4)

#Amplitude
max(means.2)-min(means.2)
max(means.3)-min(means.3)
max(means.4)-min(means.4)

#Definindo função que encontra percentual de intervalos que contém a média populacional
intervalos_media <- function(dados, n) {
  tamanho_amostra <- choose(length(dados), n)
  amostras <- combn(dados, n)
  variancias <- apply(amostras, 2, var)
  medias <- apply(amostras, 2, mean)
  
  erros_padrao <- sqrt((length(dados) - n) / length(dados)) * (sqrt(variancias)/sqrt(n))
  
  intervalos_inf <- medias - erros_padrao
  intervalos_sup <- medias + erros_padrao
  
  media_pop <- mean(data)
  contador <- 0
  for(i in 1:tamanho_amostra){
    if(media_pop > intervalos_inf[i] & media_pop < intervalos_sup[i]) {
      contador <- contador+1
    }
  }
  
  return(contador/tamanho_amostra)
}

#Encontrando percentuais de intervalos que contém a média populacional
intervalos_media(data, 2)
intervalos_media(data, 3)
intervalos_media(data, 4)

#Distribuição de cada intervalo para n = 2
#Mesma lógica das tabelas de frequência dos dados porém aplicada as médias
means_intervals <- cut(means.2, breaks = intervals, include.lowest = TRUE, right=FALSE)
freq <- table(means_intervals)
percent <- freq / length(means.2) * 100

#Distribuição de cada intervalo para n = 3
#Mesma lógica das tabelas de frequência dos dados porém aplicada as médias
means_intervals <- cut(means.3, breaks = intervals, include.lowest = TRUE, right=FALSE)
freq <- table(means_intervals)
percent <- freq / length(means.3) * 100

#Distribuição de cada intervalo para n = 4
#Mesma lógica das tabelas de frequência dos dados porém aplicada as médias
means_intervals <- cut(means.4, breaks = intervals, include.lowest = TRUE, right=FALSE)
freq <- table(means_intervals)
percent <- freq / length(means.4) * 100

#Histogramas para todos os tamanhos amostrais
#Exatamente o mesmo histograma que o primeiro, com o respectivo means no lugar de data
freq <- hist(means.2, breaks = seq(9,29,by=2),main="Relative Frequency Histogram", xlab="Data", ylab="Relative Frequency", freq=FALSE, col='steelblue')
freq$counts <- freq$counts/sum(freq$counts)*100
plot(freq, yaxt="n", xaxt='n')
axis(1, at=seq(10,30, by=2), labels=paste0(seq(10,30, by=2)))
axis(2, at=seq(0, 25, by=5), labels=paste0(seq(0, 25, by=5), "%"))

freq <- hist(means.3, breaks = seq(9,29,by=2),main="Relative Frequency Histogram", xlab="Data", ylab="Relative Frequency", freq=FALSE, col='steelblue')
freq$counts <- freq$counts/sum(freq$counts)*100
plot(freq, yaxt="n", xaxt='n')
axis(1, at=seq(10,30, by=2), labels=paste0(seq(10,30, by=2)))
axis(2, at=seq(0, 25, by=5), labels=paste0(seq(0, 25, by=5), "%"))

freq <- hist(means.4, breaks = seq(9,29,by=2),main="Relative Frequency Histogram", xlab="Data", ylab="Relative Frequency", freq=FALSE, col='steelblue')
freq$counts <- freq$counts/sum(freq$counts)*100
plot(freq, yaxt="n", xaxt='n')
axis(1, at=seq(10,30, by=2), labels=paste0(seq(10,30, by=2)))
axis(2, at=seq(0, 25, by=5), labels=paste0(seq(0, 25, by=5), "%"))
