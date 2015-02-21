library(shiny)

doPrediction <- function(idx)
{
	data_train <- faithful[-idx, ];
	data_testing <- faithful[idx, ];
	eruption.lm = lm(eruptions ~ waiting, data=data_train)

	predict_value = predict(eruption.lm, data_testing)
}

shinyServer(
	function(input, output)
	{
		output$actValue <- renderText({ faithful[input$idx, 1] })
		output$predictValue <- renderText({
			input$submitButton
			isolate( doPrediction(input$idx) )
		})
	}
)
