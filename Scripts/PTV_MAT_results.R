#Reshape Prev_MAT data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/PTV_MAT_results.csv")
head(C_T_results1)

#Select columns needed
C_T_results2 <- select(C_T_results1, 'central_code',
                                      'groupNivelSupervisao:QSupLevel',
                                      'groupNivelSupervisao:supervisor',
                                      'groupGeo:province',
                                      'groupGeo:district',
                                      'groupGeo:QGeo',
                                      'QSupCode' ,
                                      'groupForm:groupGI:QGIPartner',
                                      'groupForm:groupDS1:domainScore1',
                                      'groupForm:groupDS2:domainScore2',
                                      'groupForm:groupDS3:domainScore3',
                                      'groupForm:groupDS4:domainScore4')
head(C_T_results2)

#Rename columns
C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,
                                        "qSupLevel"= "groupNivelSupervisao:QSupLevel" ,
                                        "supervisor"= "groupNivelSupervisao:supervisor",
                                        "provinceCode"= "groupGeo:province",	
                                        "district"= "groupGeo:district",
                                        "qGeo"= "groupGeo:QGeo",
                                        "qSupCode"="QSupCode",
                                        "qGIPartner"="groupForm:groupGI:QGIPartner",
                                        "ATS e manejo dos casos" = "groupForm:groupDS1:domainScore1",
                                        "Profilaxia pos-exposicao (PPE)" = "groupForm:groupDS2:domainScore2",
                                        "ITS" = "groupForm:groupDS3:domainScore3",
                                        "Farmacia" = "groupForm:groupDS4:domainScore4")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/PTV_MAT.csv")                       
  


