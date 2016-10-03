library(ANLP)
library(tm)
## Read the data
    setwd("./final/en_US")
    blogs <- readLines("./en_US.blogs.txt", encoding = 'UTF-8', skipNul=TRUE, warn=FALSE)
    news <- readLines("./en_US.news.txt", encoding = 'UTF-8', skipNul=TRUE, warn=FALSE)
    twitter <- readLines("./en_US.twitter.txt", encoding = 'UTF-8', skipNul=TRUE, warn=FALSE)

## Working on a Sample from the data ONLY 5% due to memory constraint    
    Blogs_S <- blogs[sample(1:length(blogs), length(blogs)*0.05)]
    New_S <- news[sample(1:length(news), length(news)*0.05)]
    Twitter_S <- twitter[sample(1:length(twitter), length(twitter)*0.05)]
    TrainingSet <- c(Blogs_S,New_S,Twitter_S)
    rm(blogs,news,twitter,Blogs_S,New_S,Twitter_S)

## Cleaning the Sample

    myCorpus <-  cleanTextData(TrainingSet)
    
  rm(TrainingSet)

##Buliding n grams using ANLP library
    
    One_gram = generateTDM(myCorpus,1,T)
    Two_gram = generateTDM(myCorpus,2,T)
    Three_gram = generateTDM(myCorpus,3,T)
    Four_gram = generateTDM(myCorpus,4,T)
    Five_gram = generateTDM(myCorpus,5,T)
    
    Four_gram <- Four_gram %>% filter(freq > 1)
    Five_gram <- Five_gram %>% filter(freq > 1)    
    

# Listing models
ngramodels = list(One_gram,Two_gram,Three_gram,Four_gram,Five_gram)
saveRDS(ngramodels,file = "ngramodels.RDS")
