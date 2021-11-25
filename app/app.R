library(shiny)
library(RCurl)
library(leaflet)
library(shinythemes)
library(dplyr)

daten <- read.csv("https://raw.githubusercontent.com/GesellschaftStadtUster/kind-jugend-fam_angebote/main/angebote_kjf_uster.csv")

daten$adresse[daten$strasse != ""] <- paste0("<br><br>",as.character(daten$strasse[daten$strasse != ""])," ",as.character(daten$hausnr[daten$strasse != ""]),"<br>",as.character(daten$plz[daten$strasse != ""])," ",as.character(daten$ort[daten$strasse != ""]))
daten$adresse[daten$strasse == ""] <- ""

daten$adresse2[daten$strasse != ""] <- paste0(as.character(daten$strasse[daten$strasse != ""])," ",as.character(daten$hausnr[daten$strasse != ""]),", ",as.character(daten$plz[daten$strasse != ""])," ",as.character(daten$ort[daten$strasse != ""]))
daten$adresse2[daten$strasse == ""] <- ""

daten$beschreibung2[daten$beschreibung != ""] <- paste0("<br><br>",as.character(daten$beschreibung[daten$beschreibung != ""]))
daten$beschreibung2[daten$beschreibung == ""] <- ""

daten$website2[daten$website != ""] <- paste0("<br><br><a href=\"",as.character(daten$website[daten$website != ""]),"\" target=blank>",as.character(daten$website[daten$website != ""]),"</a>")
daten$website2[daten$website == ""] <- ""

popupinhalt <- paste0("<b>",as.character(daten$name),"</b>",
                      daten$beschreibung2,daten$adresse,daten$website2)
daten <- cbind(daten,popupinhalt)


# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("united"),

    # Application title
    titlePanel("Angebote für Kinder, Jugendliche und Familien in Uster"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("kategorie","Kategorien:",names(table(daten$kategorie)),multiple=T
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Karte", leafletOutput("karte",height = "600px")),
                        tabPanel("Tabelle", dataTableOutput("tabelle"))
            
            )
            
            
        )
    )
)

server <- function(input, output) {

    #Daten Import
    daten <- read.csv("https://raw.githubusercontent.com/GesellschaftStadtUster/kind-jugend-fam_angebote/main/angebote_kjf_uster.csv")
    
    daten$adresse[daten$strasse != ""] <- paste0("<br><br>",as.character(daten$strasse[daten$strasse != ""])," ",as.character(daten$hausnr[daten$strasse != ""]),"<br>",as.character(daten$plz[daten$strasse != ""])," ",as.character(daten$ort[daten$strasse != ""]))
    daten$adresse[daten$strasse == ""] <- ""
    
    daten$adresse2[daten$strasse != ""] <- paste0(as.character(daten$strasse[daten$strasse != ""])," ",as.character(daten$hausnr[daten$strasse != ""]),", ",as.character(daten$plz[daten$strasse != ""])," ",as.character(daten$ort[daten$strasse != ""]))
    daten$adresse2[daten$strasse == ""] <- ""
    
    daten$beschreibung2[daten$beschreibung != ""] <- paste0("<br><br>",as.character(daten$beschreibung[daten$beschreibung != ""]))
    daten$beschreibung2[daten$beschreibung == ""] <- ""
    
    daten$website2[daten$website != ""] <- paste0("<br><br><a href=\"",as.character(daten$website[daten$website != ""]),"\" target=blank>",as.character(daten$website[daten$website != ""]),"</a>")
    daten$website2[daten$website == ""] <- ""
    
    popupinhalt <- paste0("<b>",as.character(daten$name),"</b>",
                          daten$beschreibung2,daten$adresse,daten$website2)
    daten <- cbind(daten,popupinhalt)
    
    output$karte <- renderLeaflet({
        if(length(input$kategorie)==0){daten1 <- daten}
        if(length(input$kategorie)>0){daten1 <- filter(daten,kategorie==input$kategorie[1])}
        if(length(input$kategorie)>1){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[2]))}
        if(length(input$kategorie)>2){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[3]))}
        if(length(input$kategorie)>3){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[4]))}
        if(length(input$kategorie)>4){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[5]))}
        if(length(input$kategorie)>5){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[6]))}
        if(length(input$kategorie)>6){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[7]))}
        if(length(input$kategorie)>7){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[8]))}
        if(length(input$kategorie)>8){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[9]))}
        if(length(input$kategorie)>9){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[10]))}
        if(length(input$kategorie)>10){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[11]))}
        
        
        leaflet() %>%
          #  addProviderTiles(providers$Stamen.TonerLite,
          #                   options = providerTileOptions(noWrap = TRUE)
          #  ) %>%
            addProviderTiles(providers$CartoDB.Positron) %>%
            addMarkers(daten1$lng,daten1$lat, popup = daten1$popupinhalt, clusterOptions = markerClusterOptions())
    })
    
    output$tabelle <- renderDataTable({
        if(length(input$kategorie)==0){daten1 <- daten}
        if(length(input$kategorie)>0){daten1 <- filter(daten,kategorie==input$kategorie[1])}
        if(length(input$kategorie)>1){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[2]))}
        if(length(input$kategorie)>2){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[3]))}
        if(length(input$kategorie)>3){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[4]))}
        if(length(input$kategorie)>4){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[5]))}
        if(length(input$kategorie)>5){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[6]))}
        if(length(input$kategorie)>6){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[7]))}
        if(length(input$kategorie)>7){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[8]))}
        if(length(input$kategorie)>8){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[9]))}
        if(length(input$kategorie)>9){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[10]))}
        if(length(input$kategorie)>10){daten1 <- rbind(daten1,filter(daten,kategorie==input$kategorie[11]))}
        tabelle_angebot <- cbind(daten1[,3],daten1[,14],daten1[,11],daten1[,12])
        colnames(tabelle_angebot) <- c("Name","Adresse","Beschreibung","Webseite")
        tabelle_angebot
    })
    

}

# Run the application 
shinyApp(ui = ui, server = server)
