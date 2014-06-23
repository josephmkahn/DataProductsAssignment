library(shiny)
library(fmsb)

all.min <- 0
all.max <- 100

maxmin <- data.frame(
  Frame=c(all.max, all.min)
  , Commitment=c(all.max, all.min)
  , Logic=c(all.max, all.min)
  , Information=c(all.max, all.min)
  , Alternatives=c(all.max, all.min)
  , Objectives=c(all.max, all.min)
)

op <- par( mar=(c(0,0,0,0) )
           , mfrow=c(1, 1)
           , din=c(9,9)
           , mai=c(0, 0, 0, 0)
           ## , mai=c(0.1, 0.1, 0.1, 0.1)
           ## , mar=c(0.1, 0.1, 0.1, 0.1)
           , mar=c(0.01, 0.01, 0.01, 0.01)
           ## , omi=c(0, 0, 0, 0)
           , omi=c(0.1, 0.1, 0.1, 0.1)
           ## , pin=c(7, 7)
           , ps=17.8
           , mex=2
           ## , omd=c(0.01, 0.01, 0.01, 0.01)
)


GuideDF <- data.frame(
  At_0_Pct = c("Divergent understanding of purpose, but plowing ahead anyway",
               "Missing key stakeholders, unclear on prime value drivers, ignoring important intangibles",
               "One option / Business as Usual",
               "Lacking info on key inputs, point estimates rather than ranges/distributions",
               "Missing key issues, while over-complex on others. Results are confusing to the decision maker",
               "Lack of stakeholder support, organizational hurdles, continual rework, too early or too late"),
  
  At_100_Pct = c("Alignment by key stakeholders and experts, and committed to the process",
                 "Quantitative tradeoffs among stakeholders' key metrics, including time and risk preferences",
                 "Multiple compelling Strategies",
                 "Relevant info assessed and reviewed from trusted sources. Ranges and uncertainties well characterized",
                 "Best choice(s) are clear, model is trusted, insights verified and robust",
                 "Stakeholders bought in, team aligned, resources committed"))

rownames(GuideDF) = c("Appropriate Frame",
                      "Clear Objectives",
                      "Creative Alternatives",
                      "Useful Information",
                      "Sound Reasoning",
                      "Commitment to Action")

colnames(GuideDF) = c("At 0%","At 100%")



shinyServer(function(input, output) {
  
  output$guideTable <- renderTable(GuideDF)
  
  
  output$plot <- renderPlot(function() {
    
    dat <- data.frame(
      Frame=input$Frame
      , Commitment=input$Commitment
      , Logic=input$Logic
      , Information=input$Information
      , Alternatives=input$Alternatives
      , Objectives=input$Objectives
    )
    
    dat <- rbind(maxmin,dat)
    
    
    radarchart(dat
               ## ## , axistype=0
               , seg=5
               , plty=1
               , vlabels=c("Appropriate\nFrame"
                           , "Commitment to\nAction"
                           , "Sound\nReasoning"
                           , "Useful\nInformation"
                           , "Creative\nAlternatives"
                           , "Clear\nObjectives"
               )
               ## , pcol=1               #black
               ## , pcol=2               #red
               ## , pcol=3               #green
               ## , pcol=4               #blue
               ## , pcol=5               # cyan(light blue)
               ## , pcol=6               # pink
               ## , pcol=7               # yellow
               ## , pcol=8               # gray
               ## , pcol=9               # repeat color 1 above
               ## , pcol=seq(2,8)
               , pcol="deeppink4"               #blue
               , plwd=3
               , cglwd=2
               , pfcol=c("darksalmon", 1, NA, NA, NA, NA)
               ## pfcol=c(8)
               , cex=1.5
               , cex.lab=1.5
               , cex.main=1.5
               , cex.sub=1.5
               , pdensity=20
    )
    
    
    
  }, width=500, height=490)
  
})
