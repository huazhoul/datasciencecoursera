library(shiny)
shinyUI(pageWithSidebar(
	headerPanel("Developing Data Product Course Project"),
	sidebarPanel(
		h3('The index of sample to predict'),
		numericInput('idx', 'The index of data to be used for prediction', 100, min = 1, max = 272, step = 1),
		actionButton("submitButton", "Click button to start prediction")
	),
	mainPanel(
		h3('Actual value'),
		verbatimTextOutput("actValue"),
		h3('Predicted value'),
		verbatimTextOutput("predictValue")
	)
))
