library(dplyr)

filtro_ui <- function(id){
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        uiOutput(ns("especies"))
      ),
      mainPanel(
        tableOutput(ns("dados_filtrados"))
      )
    )
  )
}

filtro_server <- function(id, dados){
  ns <- NS(id)
  
  #dados <- iris
  
  moduleServer(id, function(input, output, session){
    output$especies <- 
      renderUI(
        {
          selectInput(
            inputId = ns("especies"),
            label = "Selecione a espécie",
            choices = unique(dados$Species)
          )
        }
      )
    output$dados_filtrados <- 
      
      renderTable(
        {
          dados %>%
            filter(Species == input$especies)
        }
      )
  })
}