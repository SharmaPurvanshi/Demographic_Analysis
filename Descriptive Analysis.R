#Load packages
library(corrplot)

library(dplyr)




# Read the data and prepare it 
data  <- read.csv("/Users/purvanshisharma/Downloads/census2002_2022.csv")
data.df <- as.data.frame(data)
#stat.desc(data.df)

#Remove rows that has '<NA>' variables
dataNA <- data.df[rowSums(is.na(data.df)) > 0,]
data_without_NA <- data.df[rowSums(is.na(data.df)) == 0,]


#Divide data according to year
data_2022 <- data_without_NA[which(data_without_NA$Year == '2022'),]
data_2002 <- data_without_NA[which(data_without_NA$Year == '2002'),]


#TASK 1

# Frequency distribution of numerical variables on the basis of Life Expectancy:

# Five number summary plus mean for each of the numerical variables: (add variance)
summ_LEB=round(summary(data_2022$Life.Expectancy.at.Birth..Both.Sexes),2)
summ_LEBM=round(summary(data_2022$Life.Expectancy.at.Birth..Males),2)
summ_LEBF=round(summary(data_2022$Life.Expectancy.at.Birth..Females),2)
#summ_LEF=round(summary(data_2022$life.expectancy.females),2)
summ_all= list(summ_LEB,summ_LEBM,summ_LEBF)
df_summ <- data.frame(matrix(unlist(summ_all), nrow=length(summ_all), 
                             byrow=TRUE))
variables_ <- c("Life exp both sexes", "Life Expectancy for males"
                ,"Life Expectancy for Females")
df_summ  <- data.frame(variables_, df_summ)
colnames(df_summ) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                       "3rd Qu","Max")


# Frequency distribution of numerical variables on the basis of Mortality Rate:

# Five number summary plus mean for each of the numerical variables: (add variance)
summ_UMB=round(summary(data_2022$Under.Age.5.Mortality..Both.Sexes),2)
summ_UMM=round(summary(data_2022$Under.Age.5.Mortality..Males),2)
summ_UMF=round(summary(data_2022$Under.Age.5.Mortality..Females),2)
#summ_LEF=round(summary(data_2022$life.expectancy.females),2)
summ_all_m= list(summ_UMB,summ_UMM,summ_UMF)
df_summ_m <- data.frame(matrix(unlist(summ_all_m), nrow=length(summ_all_m), 
                             byrow=TRUE))
variables_m <- c("Under Age 5 Mortality of Both Sexes", "Under Age 5 Mortality of Males "
                ,"Under Age 5 Mortality of Females")
df_summ_m  <- data.frame(variables_m, df_summ_m)
colnames(df_summ_m) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                       "3rd Qu","Max")
#added for life expectancy and Mortality
df_summ
df_summ_m

# Description using graphical methods for Life Expectancy: Histograms
LEB_Hist <- hist(data_2022$Life.Expectancy.at.Birth..Both.Sexes, 
                 main="Life Expectancy at Birth Of Both Sexes for 2022", 
                 xlab="Life Expectancy of Both Sexes",labels=TRUE)
LEM_Hist <- hist(data_2022$Life.Expectancy.at.Birth..Males, 
                 main="Life Expectancy Of Males for 2022", 
                 xlab="Life Expectancy Of Males",labels=TRUE)
LEF_Hist <-hist(data_2022$Life.Expectancy.at.Birth..Females, 
                main="Life Expectancy Of Females for 2022", 
                xlab="Life Expectancy Of Females",labels=TRUE)

# Description using graphical methods for mortality: Histograms
UAB_Hist <- hist(data_2022$Under.Age.5.Mortality..Both.Sexes, 
                 main="Under Age 5 Mortality Both Sexes for 2022", 
                 xlab="Under Age 5 Mortality of Both Sexes",labels=TRUE)
UAM_Hist <- hist(data_2022$Under.Age.5.Mortality..Males, 
                 main="Under Age 5 Mortality Of Males for 2022", 
                 xlab="Under Age 5 Mortality Of Males",labels=TRUE)
UAF_Hist <-hist(data_2022$Under.Age.5.Mortality..Females, 
                main="Under Age 5 Mortality Of Females for 2022", 
                xlab="Under Age 5 Mortality Of Females",labels=TRUE)
# Histogram showing the life expectancy of both females and males for Life Expectancy
# comparison reasons: (add the deep purple in the legend)
hist(data_2022$Life.Expectancy.at.Birth..Females, main = 'Life Expectancy',
     col = rgb(1, 0, 0, 0.5),
     xlab = 'life expectancy 2022',
     xlim = c(40, 100),
     ylim = c(0, 80))

hist(data_2022$Life.Expectancy.at.Birth..Males,
     col = rgb(0, 0, 1, 0.5),
     add = TRUE)
legend('topright', c('Females', 'Males', 'Intersection'),
       fill=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5), rgb(146, 90, 204, maxColorValue = 255)))

# Histogram showing the life expectancy of both females and males for Under Age 5 Mortality 
# comparison reasons: (add the deep purple in the legend)
hist(data_2022$Under.Age.5.Mortality..Both.Sexes, main = 'Under Age 5 Motality',
     col = rgb(1, 0, 0, 0.5),
     xlab = 'Under Age 5 Mortalty for 2022',
     xlim = c(40, 100),
     ylim = c(0, 80))

hist(data_2022$Under.Age.5.Mortality..Males,
     col = rgb(0, 0, 1, 0.5),
     add = TRUE)
legend('topright', c('Females', 'Males', 'Intersection'),
       fill=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5), rgb(146, 90, 204, maxColorValue = 255)))



###Regions
r <- unique(data_2022[c("Region")])
r
R_Asia <- data_2022[data_2022$Region == 'Asia', ]
R_Europe <- data_2022[data_2022$Region == 'Europe', ]
R_Africa <- data_2022[data_2022$Region == 'Africa', ]
R_Oceania <- data_2022[data_2022$Region == 'Oceania', ]
R_Americas <- data_2022[data_2022$Region == 'Americas', ]


####Statistical Method for differentianing between the Regions(Life Expectancy)
# Five number summary for Asia
RAs_summ_LEB=round(summary(R_Asia$Life.Expectancy.at.Birth..Both.Sexes),2)
RAs_summ_LEBM=round(summary(R_Asia$Life.Expectancy.at.Birth..Males),2)
RAs_summ_LEBF=round(summary(R_Asia$Life.Expectancy.at.Birth..Females),2)
summ_all_RAs= list(RAs_summ_LEB,RAs_summ_LEBM,RAs_summ_LEBF)
df_summ_RAs <- data.frame(matrix(unlist(summ_all_RAs), nrow=length(summ_all_RAs), 
                               byrow=TRUE))
variables_RAs <- c("Life expectancy both sexes in Asia", "Life Expectancy for males in Asia"
                  ,"Life Expectancy for Females in Asia")
df_summ_RAs  <- data.frame(variables_RAs, df_summ_RAs)
colnames(df_summ_RAs) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                         "3rd Qu","Max")
# Five number summary for Europe
RE_summ_LEB=round(summary(R_Europe$Life.Expectancy.at.Birth..Both.Sexes),2)
RE_summ_LEBM=round(summary(R_Europe$Life.Expectancy.at.Birth..Males),2)
RE_summ_LEBF=round(summary(R_Europe$Life.Expectancy.at.Birth..Females),2)
summ_all_RE= list(RAs_summ_LEB,RAs_summ_LEBM,RAs_summ_LEBF)
df_summ_RE <- data.frame(matrix(unlist(summ_all_RE), nrow=length(summ_all_RE), 
                                byrow=TRUE))
variables_RE <- c("Life expectancy both sexes in Europe", "Life Expectancy for males in Europe"
                  ,"Life Expectancy for Females in Europe")
df_summ_RE  <- data.frame(variables_RE, df_summ_RE)
colnames(df_summ_RE) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                          "3rd Qu","Max")
## Five number summary for Africa
RAf_summ_LEB=round(summary(R_Africa$Life.Expectancy.at.Birth..Both.Sexes),2)
RAf_summ_LEBM=round(summary(R_Africa$Life.Expectancy.at.Birth..Males),2)
RAf_summ_LEBF=round(summary(R_Africa$Life.Expectancy.at.Birth..Females),2)
summ_all_RAf= list(RAf_summ_LEB,RAf_summ_LEBM,RAf_summ_LEBF)
df_summ_RAf <- data.frame(matrix(unlist(summ_all_RAf), nrow=length(summ_all_RAf), 
                                 byrow=TRUE))
variables_RAf <- c("Life Expectancy both sexes in Africa", "Life Expectancy for males in Africa"
                   ,"Life Expectancy for Females in Africa")
df_summ_RAf  <- data.frame(variables_RAf, df_summ_RAf)
colnames(df_summ_RAf) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                           "3rd Qu","Max")
# Five number summary for Oceana
RO_summ_LEB=round(summary(R_Oceania$Life.Expectancy.at.Birth..Both.Sexes),2)
RO_summ_LEBM=round(summary(R_Oceania$Life.Expectancy.at.Birth..Males),2)
RO_summ_LEBF=round(summary(R_Oceania$Life.Expectancy.at.Birth..Females),2)
summ_all_RO= list(RO_summ_LEB,RO_summ_LEBM,RO_summ_LEBF)
df_summ_RO <- data.frame(matrix(unlist(summ_all_RO), nrow=length(summ_all_RO), 
                                 byrow=TRUE))
variables_RO <- c("Life Expectancy both sexes in Oceania", "Life Expectancy for males in Oceania"
                   ,"Life Expectancy for Females in Oceania")
df_summ_RO  <- data.frame(variables_RO, df_summ_RO)
colnames(df_summ_RO) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                           "3rd Qu","Max")
# Five number summary for Americas
RAm_summ_LEB=round(summary(R_Americas$Life.Expectancy.at.Birth..Both.Sexes),2)
RAm_summ_LEBM=round(summary(R_Americas$Life.Expectancy.at.Birth..Males),2)
RAm_summ_LEBF=round(summary(R_Americas$Life.Expectancy.at.Birth..Females),2)
summ_all_RAm= list(RAm_summ_LEB,RAm_summ_LEBM,RAm_summ_LEBF)
df_summ_RAm <- data.frame(matrix(unlist(summ_all_RAm), nrow=length(summ_all_RAm), 
                                 byrow=TRUE))
variables_RAm <- c("Life Expectancy both sexes in America", "Life Expectancy for males in America"
                   ,"Life Expectancy for Females in America")
df_summ_RAm  <- data.frame(variables_RAm, df_summ_RAm)
colnames(df_summ_RAm) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                           "3rd Qu","Max")
bind_rows(df_summ_RAs,df_summ_RE,df_summ_RAf,df_summ_RO,df_summ_RAm)

###Graphical Representation(Life Expectancy)Box plots
r_plot_both <- ggplot(data_2022, aes(x=Region,y=Life.Expectancy.at.Birth..Both.Sexes, fill= region),sort = data_2022$region)+
  geom_boxplot(aes(fill=Region))+  labs(x="Life Expectancy of Both Sexes",y="Region")
r_plot_both
r_plot_Males <- ggplot(data_2022, aes(x=Region,y=Life.Expectancy.at.Birth..Males, fill= region),sort = data_2022$region)+
  geom_boxplot(aes(fill=Region))+  labs(x="Life Expectancy of Males",y="Region")
r_plot_Males
r_plot_Females <- ggplot(data_2022, aes(x=Region,y=Life.Expectancy.at.Birth..Females, fill= region),sort = data_2022$region)+
  geom_boxplot(aes(fill=Region))+  labs(x="Life Expectancy of Females",y="Region")
r_plot_Females

####Statistical Method for differentiating between the Regions(Mortality)
## Five number summary for Asia(Mortality)
RAs_summ_UMB=round(summary(R_Asia$Under.Age.5.Mortality..Both.Sexes),2)
RAs_summ_UMM=round(summary(R_Asia$Under.Age.5.Mortality..Males),2)
RAs_summ_UMF=round(summary(R_Asia$Under.Age.5.Mortality..Females),2)

summ_all_RmAs= list(RAs_summ_UMB,RAs_summ_UMM,RAs_summ_UMF)
df_summ_RmAs <- data.frame(matrix(unlist(summ_all_RmAs), nrow=length(summ_all_RmAs), 
                               byrow=TRUE))
variables_RmAs <- c("Under Age 5 Mortality of Both Sexes in Asia", "Under Age 5 Mortality of Males in Asia "
                 ,"Under Age 5 Mortality of Females in Asia")
df_summ_RmAs  <- data.frame(variables_RmAs, df_summ_RmAs)
colnames(df_summ_RmAs) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                         "3rd Qu","Max")

## Five number summary for Europe(Mortality)
RE_summ_UMB=round(summary(R_Europe$Under.Age.5.Mortality..Both.Sexes),2)
RE_summ_UMM=round(summary(R_Europe$Under.Age.5.Mortality..Males),2)
RE_summ_UMF=round(summary(R_Europe$Under.Age.5.Mortality..Females),2)

summ_all_RmE= list(RE_summ_UMB,RE_summ_UMM,RE_summ_UMF)
df_summ_RmE <- data.frame(matrix(unlist(summ_all_RmE), nrow=length(summ_all_RmE), 
                                  byrow=TRUE))
variables_RmE <- c("Under Age 5 Mortality of Both Sexes in Europe", "Under Age 5 Mortality of Males in Europe "
                    ,"Under Age 5 Mortality of Females in Europe")
df_summ_RmE  <- data.frame(variables_RmE, df_summ_RmE)
colnames(df_summ_RmE) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                            "3rd Qu","Max")

## Five number summary for Africa(Mortality)
RAf_summ_UMB=round(summary(R_Africa$Under.Age.5.Mortality..Both.Sexes),2)
RAf_summ_UMM=round(summary(R_Africa$Under.Age.5.Mortality..Males),2)
RAf_summ_UMF=round(summary(R_Africa$Under.Age.5.Mortality..Females),2)

summ_all_RmAf= list(RAf_summ_UMB,RAf_summ_UMM,RAf_summ_UMF)
df_summ_RmAf <- data.frame(matrix(unlist(summ_all_RmAf), nrow=length(summ_all_RmAf), 
                                  byrow=TRUE))
variables_RmAf <- c("Under Age 5 Mortality of Both Sexes in Africa", "Under Age 5 Mortality of Males in Africa "
                    ,"Under Age 5 Mortality of Females in Africa")
df_summ_RmAf  <- data.frame(variables_RmAf, df_summ_RmAf)
colnames(df_summ_RmAf) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                            "3rd Qu","Max")

## Five number summary for Oceania(Mortality)
RO_summ_UMB=round(summary(R_Oceania$Under.Age.5.Mortality..Both.Sexes),2)
RO_summ_UMM=round(summary(R_Oceania$Under.Age.5.Mortality..Males),2)
RO_summ_UMF=round(summary(R_Oceania$Under.Age.5.Mortality..Females),2)
summ_all_RmO= list(RO_summ_UMB,RO_summ_UMM,RO_summ_UMF)
df_summ_RmO <- data.frame(matrix(unlist(summ_all_RmO), nrow=length(summ_all_RmO), 
                                  byrow=TRUE))
variables_RmO <- c("Under Age 5 Mortality of Both Sexes In Oceania", "Under Age 5 Mortality of Males in Oceania "
                    ,"Under Age 5 Mortality of Females in Oceania")
df_summ_RmO  <- data.frame(variables_RmO, df_summ_RmO)
colnames(df_summ_RmO) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                            "3rd Qu","Max")

## Five number summary for America(Mortality)
RAm_summ_UMB=round(summary(R_Americas$Under.Age.5.Mortality..Both.Sexes),2)
RAm_summ_UMM=round(summary(R_Americas$Under.Age.5.Mortality..Males),2)
RAm_summ_UMF=round(summary(R_Americas$Under.Age.5.Mortality..Females),2)

summ_all_RmAm= list(RAm_summ_UMB,RAm_summ_UMM,RAm_summ_UMF)
df_summ_RmAm <- data.frame(matrix(unlist(summ_all_RmAm), nrow=length(summ_all_RmAm), 
                                  byrow=TRUE))
variables_RmAm <- c("Under Age 5 Mortality of Both Sexes in America", "Under Age 5 Mortality of Males in America"
                    ,"Under Age 5 Mortality of Females in America")
df_summ_RmAm  <- data.frame(variables_RmAm, df_summ_RmAm)
colnames(df_summ_RmAm) <- c("Variable Name","Min", "1st Qu", "Median", "Mean",
                            "3rd Qu","Max")
###Mortality in Regions
bind_rows(df_summ_RmAs,df_summ_RmE,df_summ_RmAf,df_summ_RmO,df_summ_RmAm)

#### Graphical Representation(Mortality)
rM_plot_Both <- ggplot(data_2022, aes(x=Region,y=Under.Age.5.Mortality..Both.Sexes, fill= region),sort = data_2022$region)+
  geom_boxplot(aes(fill=Region))+  labs(x="Under Age 5 Mortality of Both sexes",y="Region")
rM_plot_Both

rM_plot_Males <- ggplot(data_2022, aes(x=Region,y=Under.Age.5.Mortality..Males, fill= region),sort = data_2022$region)+
  geom_boxplot(aes(fill=Region))+  labs(x="Under Age 5 Mortality of Males",y="Region")
rM_plot_Males
rM_plot_Females <- ggplot(data_2022, aes(x=Region,y=Under.Age.5.Mortality..Females, fill= region),sort = data_2022$region)+
  geom_boxplot(aes(fill=Region))+  labs(x="Under Age 5 Mortality of Females",y="Region")
rM_plot_Females




#TASK 2

# Statistical method:
#Median per subregion(Life Expectancy)
df_median_Life <-data.frame(R_Europe%>%
                         group_by(Year,Subregion)%>% 
                         summarise(Life_Expectancy_both=median(Life.Expectancy.at.Birth..Both.Sexes),
                                   Life_Expectancy_Males=median(Life.Expectancy.at.Birth..Males),
                                   Life_Expectancy_Females=median(Life.Expectancy.at.Birth..Females)))

df_median_Life
# IQR per subregion(Life Expectancy)
df_IQR_Life<-data.frame(R_Europe%>%
                     group_by(Year,Subregion)%>% 
                     summarise(Life_Expectancy_both=quantile(Life.Expectancy.at.Birth..Both.Sexes,0.75)-quantile(Life.Expectancy.at.Birth..Both.Sexes,0.25),
                               Life_Expectancy_Males=quantile(Life.Expectancy.at.Birth..Males,0.75)-quantile(Life.Expectancy.at.Birth..Males,0.25),
                               Life_Expectancy_Females=quantile(Life.Expectancy.at.Birth..Females,0.75)-quantile(Life.Expectancy.at.Birth..Females,0.25)))
df_IQR_Life
#Median per subregion(Mortality)
df_median_Mortality <-data.frame(R_Europe%>%
                              group_by(Year,Subregion)%>% 
                              summarise(Mortality_Of_BothSexes=median(Under.Age.5.Mortality..Both.Sexes),
                                        Mortality_Of_Males=median(Under.Age.5.Mortality..Males),
                                        Mortality_Of_Females=median(Under.Age.5.Mortality..Females)))




df_median_Mortality
# IQR per subregion(Mortality)
df_IQR_Mortality<-data.frame(R_Europe%>%
                     group_by(Year,Subregion)%>% 
                     summarise(Mortality_Of_BothSexes=quantile(Under.Age.5.Mortality..Both.Sexes,0.75)-quantile(Under.Age.5.Mortality..Both.Sexes,0.25),
                               Mortality_Of_Males=quantile(Under.Age.5.Mortality..Males,0.75)-quantile(Under.Age.5.Mortality..Males,0.25),
                               Mortality_Of_Females=quantile(Under.Age.5.Mortality..Females,0.75)-quantile(Under.Age.5.Mortality..Females,0.25)))
df_IQR_Mortality

# Graphical Method:
arr <-  R_Europe %>% distinct(Subregion,Region) %>% arrange(Region)


LE_boxplots = ggplot(R_Europe, aes(x=Life.Expectancy.at.Birth..Both.Sexes,y=factor(Subregion,levels= arr$Subregion)
                                    , fill= Region),sort = R_Europe$Region)+
  geom_boxplot(aes(fill=Region))+
  labs(x="Life Expectancy of both sexes",y="Subregion")

LEM_boxplots = ggplot(R_Europe, aes(x=Life.Expectancy.at.Birth..Males,y=factor(Subregion,levels= arr$Subregion)
                                     , fill= Region),sort = R_Europe$Region)+
  geom_boxplot(aes(fill=Region))+
  labs(x="Life Expectancy of Males",y="Subregion")

LEF_boxplots = ggplot(R_Europe, aes(x=Life.Expectancy.at.Birth..Females,y=factor(Subregion,levels= arr$Subregion)
                                     , fill= Region),sort = R_Europe$Region)+
  geom_boxplot(aes(fill=Region))+
  labs(x="Life Expectancy of Females",y="Subregion") 
M_boxplots = ggplot(R_Europe, aes(x=Under.Age.5.Mortality..Both.Sexes,y=factor(Subregion,levels= arr$Subregion)
                                    , fill= Region),sort = R_Europe$Region)+
  geom_boxplot(aes(fill=Region))+
  labs(x="Under Age 5 Mortalaty of Both Sexes",y="Subregion")

MM_boxplots = ggplot(R_Europe, aes(x=Under.Age.5.Mortality..Males,y=factor(Subregion,levels= arr$Subregion)
                                     , fill= Region),sort = R_Europe$Region)+
  geom_boxplot(aes(fill=Region))+
  labs(x="Under Age 5 Mortality of Males",y="Subregion")

MF_boxplots = ggplot(R_Europe, aes(x=Under.Age.5.Mortality..Females,y=factor(Subregion,levels= arr$Subregion)
                                     , fill= Region),sort = R_Europe$Region)+
  geom_boxplot(aes(fill=Region))+
  labs(x="Under Age 5 Mortality of Females",y="Subregion") 



LE_boxplots
LEM_boxplots
LEF_boxplots
M_boxplots
MM_boxplots
MF_boxplots
# TASK 3

# sample data
numeric_data <- data_2022[, 6:11] # Numerical variables
groups <- data_2022[, c(2, 3)] # Factor variables

# Correlation between numerical variables:
# Statistical method:
Correlation_numeric <- cor(data_2022[, c( 'Life.Expectancy.at.Birth..Both.Sexes',
                                          'Life.Expectancy.at.Birth..Males',
                                          'Life.Expectancy.at.Birth..Females',
                                          'Under.Age.5.Mortality..Both.Sexes',
                                          'Under.Age.5.Mortality..Males',
                                          'Under.Age.5.Mortality..Females')])
# Graphical method:
pairs(numeric_data,labels = colnames(numeric_data))
#Heatmap
corrplot(Correlation_numeric, method="number")


#4 TASK 4
#Statistical Method: roll-up by year
melted = melt(data_2022, id.vars = c("Year"),
              measure.vars = c( 'Life.Expectancy.at.Birth..Both.Sexes',
                                'Life.Expectancy.at.Birth..Males',
                                'Life.Expectancy.at.Birth..Females',
                                'Under.Age.5.Mortality..Both.Sexes',
                                'Under.Age.5.Mortality..Males',
                                'Under.Age.5.Mortality..Females'))
dfc<-data.frame(melted%>%
                  group_by(Year,variable)%>%
                  summarise(Q1st=quantile(value,0.25),
                            Mean=mean(value),
                            Median=median(value),
                            Q3rd=quantile(value,0.75),
                            IQR=quantile(value,0.75)-quantile(value,0.25)))
dfc
melted1 <- melt(data_2002, id.vars = c("Year"),
                measure.vars = c( 'Life.Expectancy.at.Birth..Both.Sexes',
                                  'Life.Expectancy.at.Birth..Males',
                                  'Life.Expectancy.at.Birth..Females',
                                  'Under.Age.5.Mortality..Both.Sexes',
                                  'Under.Age.5.Mortality..Males',
                                  'Under.Age.5.Mortality..Females'))
dfc1<-data.frame(melted1%>%group_by(Year,variable)%>%
                   summarise(Q1st=quantile(value,0.25),
                             Mean=mean(value),
                             Median=median(value),
                             Q3rd=quantile(value,0.75),
                             IQR=quantile(value,0.75)-quantile(value,0.25)))
dfc1
#Graphical Method:
DataExplorer::plot_boxplot(data_without_NA, by = ("Year"))
