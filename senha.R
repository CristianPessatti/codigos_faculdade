gera_senha <- function(n = 10) {
  M <- LETTERS
  m <- letters
  N <- 0:9
  s <- c("%", "#", "$", "_", "+", "=", "-",
         "*", "/", "&", "!", "@", "?")
  chars <- sample(c(M, m, N, s),
                  size = n,
                  replace = TRUE)
  password <- paste(chars, collapse = "")
  return(password)
}

ifelse()

forca_senha <- function(senha) {
  forca <- ifelse(grepl(pattern = "[[:upper:]]", x = senha), 2, 0)
  forca <- ifelse(grepl(pattern = "[[:digit:]]", x = senha), forca+2, forca)
  forca <- ifelse(grepl(pattern = "[[:punct:]]", x = senha), forca+4, forca)
  if(nchar(senha) > 10){
    forca <- forca+5
  }else if(nchar(senha) >= 8) {
    forca <- forca+3
  }else if(nchar(senha) >= 5) {
    forca <- forca+1
  }
  
  if(forca < 4) {
    classificacao <- 'I'
  }else if(forca < 8) {
    classificacao <- 'II'
  }else if(forca< 12) {
    classificacao <- 'III'
  }else {
    classificacao <- 'IV'
  }
  
  return(classificacao)
}

senha <- gera_senha(10)
senha

forca_senha('Ajj%n?')
forca_senha('Lox99j-9')
forca_senha('ZmY3tY')

teste_senhas <- replicate(1000000, forca_senha(gera_senha(10)))
tabela_senhas <- table(teste_senhas)
(tabela_senhas/sum(tabela_senhas))*100

teste_senhas <- replicate(100000, forca_senha(gera_senha(7)))
tabela_senhas <- table(teste_senhas)
(tabela_senhas/sum(tabela_senhas))*100
