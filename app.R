# Load necessary libraries
library(shiny)
library(ggplot2)
library(dplyr)

# Sample data (replace this with your actual `arsenal_stats` dataset)
arsenal_stats <- data.frame(
  Player = c("Player1", "Player2", "Player3", "Player4", "Player5"),
  xG_Expected = c(5.2, 3.4, 7.8, 6.1, 4.3),
  xAG_Expected = c(3.1, 2.5, 4.3, 3.7, 2.8),  # Add xAG_Expected column
  Pos = c("FW", "MF", "FW", "DF", "MF")
)

# Define UI for the dashboard
ui <- fluidPage(
  titlePanel("Arsenal Player Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "position",
        label = "Select Position:",
        choices = unique(arsenal_stats$Pos),  # Populate dropdown with positions
        selected = "FW"
      )
    ),
    
    mainPanel(
      plotOutput(outputId = "xgPlot"),  # Display the xG plot
      plotOutput(outputId = "xagPlot"),  # Display the xAG plot
      tableOutput(outputId = "playerTable")  # Optional: Show data table below the charts
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive data based on user input
  filtered_data <- reactive({
    arsenal_stats %>%
      filter(Pos == input$position)  # Filter data based on selected position
  })
  
  # Generate the xG plot
  output$xgPlot <- renderPlot({
    ggplot(filtered_data(), aes(
      x = reorder(Player, -xG_Expected),  # Order players by xG_Expected
      y = xG_Expected,
      fill = Pos
    )) +
      geom_bar(stat = "identity") +  # Create a bar chart
      coord_flip() +  # Flip coordinates for better readability
      theme_minimal() +
      labs(
        title = paste("Expected Goals (xG) by Players - Position:", input$position),
        x = "Player",
        y = "Expected Goals (xG)"
      )
  })
  
  # Generate the xAG plot
  output$xagPlot <- renderPlot({
    ggplot(filtered_data(), aes(
      x = xAG_Expected,  # xAG on the x-axis
      y = reorder(Player, xAG_Expected),  # Player on the y-axis ordered by xAG
      fill = Pos
    )) +
      geom_col() +  # Create a column chart
      theme_minimal() +
      labs(
        title = paste("Expected Assists (xAG) by Players - Position:", input$position),
        x = "Expected Assists (xAG)",
        y = "Player"
      )
  })
  
  # Display the filtered data as a table (optional)
  output$playerTable <- renderTable({
    filtered_data()
  })
}

# Run the application
shinyApp(ui = ui, server = server)

shiny::runApp("app.R")


