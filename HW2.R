df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine', 'James'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas', 'Michigan'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14, 1))
aggregate(df1$Sales, by=list(df1$State), FUN=sum)
library(dplyr)
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

world_cup = read.csv('C:/users/zacha/documents/college/summer2022/datavis/week3/worldcupmatches.csv')

dim(world_cup) 
#852 rows, 20 columns 

summary(world_cup)
#shows a summary of the world_cup dataframe. Includes the column names; their lengths, class, mode 
#                                           or their minimum, 1st quadrant, median, mean, 3rd quadrant and max   

count(unique(world_cup['City']))
#151 

mean(world_cup$Attendance, na.rm = TRUE) 
#45164.8 

head(world_cup %>% group_by(Home.Team.Name) %>% summarise(sum(Home.Team.Goals)))
#<chr>                           <int>
#1 Algeria                             5
#2 Angola                              0
#3 Argentina                         111
#4 Australia                           7
#5 Austria                            31
#6 Belgium                            27

world_cup %>% group_by(Year) %>% summarise(mean(Attendance, na.rm = TRUE))
#<int>                            <dbl>
#1  1930                           32808.
#2  1934                           21353.
#3  1938                           20872.
#4  1950                           47511.
#5  1954                           29562.
#6  1958                           23423.
#7  1962                           27912.
#8  1966                           48848.
#9  1970                           50124.
#10  1974                           49099.
#11  1978                           40679.
#12  1982                           40572.
#13  1986                           46039.
#14  1990                           48389.
#15  1994                           68991.
#16  1998                           43517.
#17  2002                           42269.
#18  2006                           52491.
#19  2010                           49670.
#20  2014                           55375.
#As the data shows, the average attendence rose drastically after 1962, and has continued at 
#roughly the same average since then, with a spike in 1994(hosted by the US)

#------------------------------------------------------------------------------------------------

meta = read.csv('C:/users/zacha/documents/college/summer2022/datavis/week3/metabolite.csv')

length(which(meta$Label == 'Alzheimer'))
#[1] 35

head(colSums(is.na(meta)))
#Label   Phe   Pro   Ser   Thr  ADMA 
#0     0     0     0     0     0 

newMeta = meta[!is.na(meta$Dopamine),]
head(newMeta$Dopamine)
#[1] 0.233 0.199 0.199 0.244 0.233 0.225

newMeta[is.na(newMeta$c4.OH.Pro),] = median(newMeta$c4.OH.Pro, na.rm = TRUE)
head(newMeta$c4.OH.Pro)
#[1] 0.236 0.199 0.199 0.215 0.186 0.185



