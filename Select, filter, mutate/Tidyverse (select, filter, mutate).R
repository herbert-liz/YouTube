# Manipulacion de datos para principiantes
# Utilizando tidyverse aprenderas:
# - Seleccion de variables
# - Filtrado de datos
# - Creacion de variables


# Instalar y cargar libreria
{
  install.packages("tidyverse")
  library(tidyverse)
}

 # Seleccionar un conjunto de datos
{
  # Lista de datasets de practica en R
  data()
  
  # Seleccionamos dataset: starwars
  View(starwars)
  datos <- starwars
}
 
# Ejercicio practico:
# Calcular BMI de los personajes humanos

# Seleccionamos variables importantes
{
  datos <- datos %>% select(
    name,height,mass,species
  )
}

# Filtramos solo humanos
{
  datos <- datos %>% filter(
    species == 'Human'
  )
}

# Calculamo IMC = (PESO) / (ALTURA^2)
{
  datos <- datos %>%
    mutate(
      altura_metros = height / 100,
      IMC = mass / (altura_metros**2)
    )
}

# Categorias segun peso
{
  datos <- datos %>% mutate(
    categoria_imc = case_when(
      IMC < 18.5 ~ 'Bajo',
      IMC < 24.9 ~ 'Normal',
      TRUE ~ 'Sobre peso'
    )
  )
  
  table(datos$categoria_imc)
}

# Todo en uno
{
  datos <- starwars %>% 
    select(name,height,mass,species) %>% 
    filter(species == 'Human') %>% 
    mutate(
      altura_metros = height / 100,
      IMC = mass / (altura_metros**2)
    ) %>% 
    mutate(
      categoria_imc = case_when(
        IMC < 18.5 ~ 'Bajo',
        IMC < 24.9 ~ 'Normal',
        TRUE ~ 'Sobre peso'
      )
    )
}
  


