#install packages
install.packages("magrittr")

Needed <- c("RColorBrewer", "ggplot2", "wordcloud", "biclust", "cluster", "igraph", "fpc")   
install.packages(Needed, dependencies=TRUE) 

#istall dplyr
install.packages("dplyr", dependencies=TRUE)
library(dplyr)
installed.packages()
library(tm)

#installed snowballc for stemming 
install.packages("SnowballC")
library(SnowballC)

#install Rgraphviz
source("https://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
library(Rgraphviz)

#after downloading the packages:
library(magrittr)
library(tm)
library(SnowballC)
library(Rgraphviz)
library(wordcloud)
library(RColorBrewer)
library(ggplot2)
library(cluster)
library(biclust)
library(igraph)
library(dplyr)

#pdftotext
files <- list.files(pattern = "pdf$")
system("for f in *.pdf; do pdftotext -layout -enc UTF-8 -nopgbrk \"$f\"; done")

#corpus
cname <- file.path(".", "corpus", "txt")
cname
length(dir(cname))
?file.path
dir(cname)
library(tm)
docs <- Corpus(DirSource(cname))
docs
?class
class(docs)
class(docs[[1]])
summary(docs)
inspect(docs[1])
summary(docs)
length(docs)
inspect(docs[0])
inspect(docs[11])

#viewdocs
library(magrittr)
viewDocs <- function(d, n) {d %>% extract2(n) %>% as.character() %>% writeLines()}
viewDocs(docs, 11)

#checking transformations
getTransformations()
content_transformer()

#transforms 1: replacing /@| with space
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
viewDocs(docs, 11)

#transformations 2: replacing upper case with lower case
docs <- tm_map(docs,content_transformer(tolower))
inspect(docs[11])
viewDocs(docs, 11)

#transformations 3: remove numbers
docs <- tm_map(docs, removeNumbers)

#transformations 4: replacing punctuation with space
docs <- tm_map(docs, removePunctuation)
viewDocs <- function(d, n) {d %>% extract2(n) %>% as.character() %>% writeLines()}
viewDocs(docs, 11)

#transformations 5: remove Finnish stopwords
length(stopwords("finnish"))
stopwords("finnish")
docs <- tm_map(docs, removeWords, stopwords("finnish"))
viewDocs <- function(d, n) {d %>% extract2(n) %>% as.character() %>% writeLines()}
viewDocs(docs, 11)

#5.1 do not want myos 
docs <- tm_map(docs, removeWords, c("myös"))


#transformations 6: strip whitespace
docs <- tm_map(docs, stripWhitespace)
viewDocs(docs, 11)

#transformations 7: stemming
docs <- tm_map(docs, stemDocument, language = "finnish")
viewDocs(docs, 11)
docs <- tm_map(docs, removeWords, c("myös", "vuode", "vuon", "vuot", "vuos","eri", "sen","jota", "joide", "osa"))

#creation of the DocumentTermMatrix
dtm <- DocumentTermMatrix(docs)
dtm

#DTM frequences
freq <- colSums(as.matrix(dtm))
length(freq)
ord <- order(freq)

#least frequent terms
freq[head(ord)]

#most frequent terms
freq[tail(ord)]


#remove sparse terms
dim(dtm)
dtms <- removeSparseTerms(dtm, 0.1)

dim(dtms)

freq <- colSums(as.matrix(dtms))
freq

findFreqTerms(dtm, lowfreq = 1000)

#associations for "ohjelm"
findAssocs(dtm, "ohjelm", corlimit = 0.9)

#frequency count of all words in a corpus
freq <- sort(colSums(as.matrix(dtm)), decreasing = TRUE)
head(freq, 14)

wf <- data.frame(word=names(freq), freq=freq)
head(wf)

#plotting the frequency of those words that occur more than x times
subset(wf, freq>1500) %>%
  ggplot(aes(word, freq)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1))

#wordcloud
set.seed(142)
wordcloud(names(freq), freq, min.freq = 850, colors=brewer.pal(6, "Dark2") )
