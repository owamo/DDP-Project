library(shiny)

shinyUI(
        fluidPage(
                titlePanel("Type II Diabetes Risk Calculator"),
                
                fluidRow(
                        p("This application calculates the risk of getting type II diabetes 
                          (defined as fasting blood glucose at or above 126 mg/dL) for middle-aged Caucasians.
                          The prediction algorthim is based on the findings of Wilson, Meigs, Sullivan, 
                          Fox, Nathan, D'Agostino. 'Prediction of Incident Diabetes Mellitus in Middle-aged 
                          Adults: The Framingham Offspring Study,' Archives of Internal Medicine 2007."),
                        br(),
                        p("To use this application, simply input the the individual's information in the
                          respective fields below. Then click the 'Calculate!' button on the right. The prediction
                          will update at the bottom.")),
                
                fluidRow(
                        column(4,
                               h4("General information"),
                               selectInput("age", h6("Age (years)"), 
                                           choice = list("< 50" = 1, "50-64" = 2, "> 64" = 3), selected = 1),
                               radioButtons("sex", h6("Gender"), 
                                            choice = list("Male" = 1, "Female" = 2), selected = 2),
                               numericInput("height", h6("Height (metres)"), value = 1.6, step = 0.01),
                               numericInput("weight", h6("Weight (kilograms)"), value = 70, step = 0.1)),
                        
                        column(4,
                               h4("Clinical Measurements"),
                               selectInput("fasting", h6("Fasting Glucose Level"), 
                                           choice = list("120-125 mg/dL" = 1, "< 100 mg/dL" = 2)),
                               numericInput("hdl", h6("High-density lipoprotein Level (mg/dL)"), value = 45),
                               selectInput("trigly", h6("Triglyceride Level"), 
                                           choice = list(">= 150 mg/dL" = 1, "< 150 mg/dL" = 2)),
                               selectInput("bp", h6("Systolic/Diastolic Blood Pressure"),
                                           choice = list("> 130/85 mmHg" = 1, "<= 130/85 mmHg" = 2), selected = 2)),
                        
                        column(3,
                               h4("Medical History"),
                               radioButtons("treat", h6("Receiving treatment for hypertension"), 
                                            choice = list("Yes" = 1, No = 2), selected = 2),
                               radioButtons("parent", h6("Parental history of diabetes mellitus"), 
                                            choice = list("Yes" = 1, No = 2), selected = 2),
                               br(),
                               br(),
                               actionButton("submit", "Calculate!"))),
                br(),
                br(),
                
                fluidRow(
                        h4("The predicted probability of this individual having type II diabetes in the next 7 years is:"),
                        verbatimTextOutput("risk"))
        )
)