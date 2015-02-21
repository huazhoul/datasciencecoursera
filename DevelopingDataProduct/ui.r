library(shiny)
shinyUI(navbarPage("Project",
    tabPanel("Main page",
        sidebarLayout(
            sidebarPanel(
                h3('Choose the sample to be used for prediction'),
                numericInput('idx', 'The index of data to be choosen', 100, min = 1, max = 272, step = 1),
                actionButton("submitButton", "Click button to start prediction")
            ),
            mainPanel(
                h3('The actual eruption time'),
                verbatimTextOutput("actValue"),
                h3('The predicted eruption'),
                verbatimTextOutput("predictValue")
            )
        )
    ),
    tabPanel("Documentation",
        h3('Documentation'),
        p('This webpage is to predict the duration of eruption based on waiting time between eruptions of Old Failthful geyser. The faithful dataset is usd. There are 272 observation in total. User can use the index of data to choose the sample to be used as testing data and the remaining 271 data will be used for training. The webpage will return the actual duration of eruption and predicted duration of eruption')
    )
))
