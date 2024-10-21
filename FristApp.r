#Change - web r shiny themes
#change positions
#different names

library(shiny)
library(shinythemes)

#Ui
ui<-fluidPage(theme=shinytheme("cosmo"),
              navbarPage(
                
                "Get & Display",
                tabPanel("Information",
                        sidebarPanel(
                          tags$h3("Get information:"),
                          textInput("txt1","First name: ",""),
                          textInput("txt2","Last name: ", ""),
                          textInput("phone","Phone number", ""),
                          passwordInput("password","Password", ""),
                          
                          
                          #txt1,txt2 will send data to the server
                        ),
                        mainPanel(
                          h1("Display information"),
                          
                          h4("Name: "),
                          verbatimTextOutput("txtout"),
                          
                          h4("Phone number: "),
                          verbatimTextOutput("phoneout"),
                          
                          h4("Password: "),
                          verbatimTextOutput("passwordout")
                          #txtout give output from the server
                          
                        ) # main panel
                 ), #navbar 1, tabpanel
                 
                
              ) #navbarPage
)              

server <-function(input,output){
  
  output$txtout<-renderText({
    paste(input$txt1,input$txt2,sep = " ")
    
  })
  
  output$phoneout<-renderText({
    paste(input$phone,placeholder=" ")
  })
  
  output$passwordout<-renderText({
    paste(input$password,placeholder=" ")
  })
  
} # server

#create Shiny object
shinyApp(ui= ui,server=server)

