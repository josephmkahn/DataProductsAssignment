library(shiny)


shinyUI(fluidPage(
  
  
  sidebarPanel(
    
    p("Decision Quality: any analysis in support of decision-making is only as effective as it's weakest link!"),
    
    
    HTML('<img src="picture1.png" width="100%"/>'),
    
    sliderInput('Frame', 'Appropriate Frame (%)', min=0, max=100,
                value=30, step=1, round=0,width='100%'),
    
    sliderInput('Objectives', 'Clear Objectives (%)', min=0, max=100,
                value=30, step=1, round=0,width='100%'),
    
    sliderInput('Alternatives', 'Creative, do-able alternatives (%)', min=0, max=100,
                value=30, step=1, round=0,width='100%'),
    
    sliderInput('Information', 'Useful Information (%)', min=0, max=100,
                value=30, step=1, round=0,width='100%'),
    
    sliderInput('Logic', 'Sound Analysis and Reasoning (%)', min=0, max=100,
                value=30, step=1, round=0,width='100%'),
    
    sliderInput('Commitment', 'Commitment to Action (%)', min=0, max=100,
                value=30, step=1, round=0,width='100%')  ,
    
    
    h6('Source:'),
    HTML('Decision Quality chart is based on materials from the 
         <a href="http://www.decisioneducation.org/"> Decision Education Foundation </a>')
    
    
  ),
  
  mainPanel(
    h4("Decision Quality Plot"),
    fluidRow(
      plotOutput('plot')
    ),
    fluidRow(
      tableOutput('guideTable')
      )
  )
))
