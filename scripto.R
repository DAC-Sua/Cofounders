# Variables sin correlación
a <- rnorm(1e4)
b <- rnorm(1e4)
c <- 0.2*rnorm(1e4) + 0.5 *a + 0.3*b

m0 <-  lm(c ~ a + b)

summary(m0)

# Pipe
# Variables correlacionadas

a2 <- rnorm(1e4)
b2 <- 0.6 * rnorm(1e4) + 0.4 * a2
c2 <- 0.2 * rnorm(1e4) + 0.5 * a2 + 0.3 * b2


# Efecto total de a 0.62 (0.5 + 0.12) efecto total de b 0.18
# Efecto de A total sobre C

m1 <-  lm(c2 ~ a2 + b2)
m2 <-  lm(c2 ~ a2 )

summary(m1)
summary(m2)


# Efecto de total B sobre c

m3 <- lm(c2 ~ b2)
m4 <- lm(c2 ~ b2 + a2)

summary(m3)
summary(m4)

# Fork
# Variables correlacionadas
b2 <- rnorm(1e4)
a2 <- 0.6 * rnorm(1e4) + 0.4 * b2
c2 <- 0.2 * rnorm(1e4) + 0.5 * a2 + 0.3 * b2


# Efecto total de A sobre C 0.5 efecto total de B 0.50
# Efecto de A total sobre C

m1 <-  lm(c2 ~ a2 )
m2 <-  lm(c2 ~ a2 + b2)


summary(m1)
summary(m2)

 # Efecto total de B sobre C
m3 <- lm(c2~ b2)
summary(m3)


# Collider 
# Variables correlacionadas
a2 <- rnorm(1e4)
c2 <- 0.8*rnorm(1e4)+ 0.2*a2 
b2 <- rnorm(1e4, ifelse(a2 + c2 > 0, 2, -1))

# Efecto total de A sobre C 0.5 efecto total de B 0.50
# Efecto de A total sobre C

m1 <-  lm(c2 ~ a2 )
m2 <-  lm(c2 ~ a2 + b2)


summary(m1)
summary(m2)

