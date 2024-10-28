### Question:
# Which city in PB had the highest number of deaths
# from COVID-19 in 2022?

#-------- Packages
library(tidyverse)
library(microdatasus)

#-------- Data dowloads - deaths
DO <- fetch_datasus(information_system = "SIM-DO",
                     year_start = 2022, year_end = 2022,
                     uf = "PB")

DO <- process_sim(DO)

#-------- Explorar o dataset
glimpse(DO)
DescTools::Desc(DO$CAUSABAS, plotit = FALSE)

#-------- Filtro por IAM
DO <- DO %>% filter(CAUSABAS == "B342")

#-------- Ranking de Muicípio de Residência
DO %>%
  group_by(munResNome) %>%
  summarise(Obitos = length(CAUSABAS)) %>%
  arrange(desc(Obitos))

#-------- Script completo
DO <- fetch_datasus(information_system = "SIM-DO",
                    year_start = 2022, year_end = 2022,
                    uf = "PB")
DO <- process_sim(DO)

DO %>%
  filter(CAUSABAS == "B342") %>%
  group_by(munResNome) %>%
  summarise(Obitos = length(CAUSABAS)) %>%
  arrange(desc(Obitos))

#-------- Plotting with ggplot2
DO_filtered <- DO %>%
  filter(CAUSABAS == "B342") %>%
  group_by(munResNome) %>%
  summarise(Obitos = n()) %>%
  arrange(desc(Obitos)) %>%
  top_n(15, Obitos)

ggplot(DO_filtered, aes(y = reorder(munResNome, Obitos), x = Obitos, fill = Obitos)) +
  geom_bar(stat = "identity", width = 0.7) +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  geom_text(aes(label = Obitos), hjust = -0.3, color = "black", size = 3) +
  coord_flip() +
  labs(
    title = "Top 15 Cidades com Maior Número de Óbitos por COVID-19 na Paraíba em 2022",
    y = "Município de Residência",
    x = "Número de Óbitos"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 10),
    legend.position = "none"
  )