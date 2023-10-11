library(shiny)

# ui <- fluidPage(
#   titlePanel("Estudando Shiny"),
#   
#   sidebarLayout(
#     sidebarPanel(
#       uiOutput("species")
#     ),
#     
#     mainPanel(
#       tableOutput("tabela")
#     )
#   )
#   
# )
# 
# server <- function(input, output, session){
#   
#   dados <- iris
#   
#   output$species <- 
#     renderUI(
#       {
#         selectInput(
#           inputId = "species",
#           label = "Selecione a espécie",
#           choices = unique(dados$Species)
#         )
#       }
#     )
#   
#   output$tabela <- renderTable({
#     dados[dados$Species == input$species, ]
#   })
# }

source("R/mod_filtro_especies.R")

ui <- fluidPage(
  titlePanel("Estudando Shiny"),
  filtro_ui("mod_filtro_especies")
)

server <- function(input, output, session){
  dados <- iris
  filtro_server("mod_filtro_especies", dados)
}

shiny::shinyApp(ui = ui, server = server)
