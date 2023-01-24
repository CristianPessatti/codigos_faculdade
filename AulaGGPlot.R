milsa <- read.table('http://www.leg.ufpr.br/~paulojus/dados/milsa.dat', head=T)

milsa <- transform(milsa, civil=factor(civil, labels=c('solteiro', 'casado'), levels=1:2),
                   instrucao=factor(instrucao, labels=c('1oGrau', '2oGrau', 'Superior'), lev=1:3, ord=T),
                   regiao=factor(regiao, labels=c('capital', 'interior', 'outro'), lev=c(2,1,3)))

milsa <- transform(milsa, idade = ano + mes/12)
milsa <- transform(milsa, ano=NULL, mes=NULL)

hist(milsa$salario)

library(ggplot2)

ggplot(milsa, aes(x=salario)) +
    geom_histogram(binwidth = 2, fill="#69b3a2", color="black") +
    geom_rug()

ggplot(milsa, aes(x=salario)) +
    geom_histogram(aes(y = ..density..),binwidth = 2, fill="#69b3a2", color="white", alpha=0.95) +
    geom_density(color="slateblue4", size=1.2) +
    geom_rug()

# ================================================

boxplot(milsa$salario)

ggplot(milsa, aes(y=salario)) +
        geom_boxplot(width=1, fill="steelblue1", color='gray15') +
        xlim(-1.5,1.5)

# ================================================

plot(milsa$idade,milsa$salario, pch=19)

ggplot(milsa, aes(x=idade, y=salarios)) +
    geom_point(size=2) +
    #stat_density_2d(aes(fill = ..level..), geom = "polygon", alpha=0.2)
    geom_smooth(method=lm , color="red", se=F)


# ==============================

plot(ecdf(milsa$salario))

ggplot(milsa, aes(x=salario)) +
    geom_step(stat='ecdf') +
    geom_rug()
