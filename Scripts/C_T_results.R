#Reshape C_T data-set by Green_Eye

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/SIS-Cod.xlsx")
C_T_results <- read_csv("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/Data/C_T_results.csv")
head(C_T_results)

#Select columns needed
C_T_results1 <- select(C_T_results, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                       'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:groupDS1:domainScore1',
                       'groupForm:groupDS2:domainScore2','groupForm:groupDS3:domainScoreG3','groupForm:groupDS4:domainScoreG4','groupForm:groupDS5:domainScoreG5',
                       'groupForm:groupDS7:domainScore7')
head(C_T_results1)

#Rename columns
#C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
#                       "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","domainScore1"= "groupForm:groupDS1:domainScore1",
#                       "domainScore2"="groupForm:groupDS2:domainScore2", "domainScore3"="groupForm:groupDS3:domainScoreG3", "domainScore4"="groupForm:groupDS4:domainScoreG4" ,"domainScore5"="groupForm:groupDS5:domainScoreG5",
#                       "domainScore7"= "groupForm:groupDS7:domainScore7")
#head(C_T_results3)

#convert a data frame column to numeric type...
C_T_results1$`groupGeo:province` = as.numeric(as.character(C_T_results1$`groupGeo:province`))

# Joint data frames
C_T_results2 <- inner_join(SIS_Cod, C_T_results1, by=c("SIS-Cod"="groupGeo:QGeo", "Prov-Cod" = "groupGeo:province", "Dist."= "groupGeo:district"))
head(C_T_results2)

#Write to disk
write.csv(C_T_results2, file = "Results/C_T_results.csv")                      
                       
                        

                       
                  
 