#Reshape Prev_UATS data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/Prevencao_UATS_results.csv")
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
                                      'groupForm:groupDS4:domainScore4',
                                      'groupForm:groupDS5:domainScore5',
                                      'groupForm:groupDS6:domainScore6',
                                      'groupForm:groupDS7:domainScore7',
                                      'groupForm:groupDS8:domainScore8',
                                      'groupForm:groupDS9:domainScore9',
                                      'groupForm:groupDS10:domainScore10',
                                      'groupForm:groupDS11:domainScore11',
                                      'groupForm:groupDS12:domainScore12')
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
                                        "Infraestrutura e Oferta de Servicos" = "groupForm:groupDS1:domainScore1",
                                        "Material de apoio, instrumentos de registo e consumi­veis" = "groupForm:groupDS2:domainScore2",
                                        "Conhecimento dos materiais de apoio1" = "groupForm:groupDS3:domainScore3",
                                        "Registo de informacao" = "groupForm:groupDS4:domainScore4",
                                        "Preechimento de Mapa de consumo de TDR" = "groupForm:groupDS5:domainScore5",
                                        "Ligacao aos servicos de cuidados e tratamento" = "groupForm:groupDS6:domainScore6",
                                        "Implementacao de Abordagens de Melhoria de Qualidade no Sector" = "groupForm:groupDS7:domainScore7",
                                        "Material de apoio" = "groupForm:groupDS8:domainScore8",
                                        "Consumi­veis" = "groupForm:groupDS9:domainScore9",
                                        "Conhecimento dos materiais de apoio2" = "groupForm:groupDS10:domainScore10",
                                        "Material de apoio, instrumentos de registo e consumiveis" = "groupForm:groupDS11:domainScore11",
                                        "Conhecimento dos materiais de apoio3" = "groupForm:groupDS12:domainScore12")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/Prevencao_UATS.csv")                       
  


