library(shiny)

## Define functions
age <- function(x){
        if(x == 1) return(0)
        else if(x == 2) return(-0.018)
        else return(-0.081)
}
sex <- function(x){
        if(x == 1) return(-0.010)
        else return(0)
}
parent <- function(x){
        if(x == 1) return(0.565)
        else return(0)  
}
BMI <- function(height, weight){
        if(weight*height^(-2) < 25) return(0)
        else if (weight*height^(-2) < 30) return(0.301)
        else return(0.92)
}
hyper <- function(bp, treat){
        if(bp == 1 | treat == 1) return(0.498)
        else return(0)
}
hdl <- function(x, sex){
        if((sex == 1 & x < 40) | (sex == 2 & x < 50)) return(0.944)
        else return(0)
}
trigly <- function(x){
        if(x == 1) return(0.575)
        else return(0)
}
fast <- function(x){
        if(x == 1) return(1.980)
        else return(0)
}

shinyServer(
        function(input, output) {
                output$risk <- renderText({
                        input$submit
                        
                        isolate(
                                paste(round(((1 + exp(-(-5.517 + age(input$age) +
                                                                sex(input$sex) +
                                                                parent(input$parent) +
                                                                BMI(input$height, input$weight) + 
                                                                hyper(input$bp, input$treat) +
                                                                hdl(input$hdl, input$sex) +
                                                                trigly(input$trigly) +
                                                                fast(input$fasting))))^-1)*100,
                                            digits = 2),
                                      "%", sep = "")
                        )
                        
                })
        }
)
