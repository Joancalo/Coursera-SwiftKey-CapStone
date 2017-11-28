# Set the wd properly to read the files

#  Getting the data and max line counts 
blogs <- readLines("en_US.blogs.txt")
news<- readLines("en_US.news.txt")
twit<- readLines("en_US.twitter.txt")

conblogs <- file("en_US.blogs.txt","r")
lenblogs <- nchar(readLines(conblogs))
max_len_US_blog <- max(lenblogs)
close(conblogs)

connews<- file("en_US.news.txt", "r")
lennews<- nchar(readLines(connews))
max_len_US_news <- max(lennews)
close(connews)

contwit <- file("en_US.twitter.txt", "r")
lentwit <- nchar(readLines(contwit))
max_len_US_twit <- max(lentwit)
close(contwit)

# Plotting the data
par(mfrow = c(1, 3))

hist(lenblogs, breaks = 1000, xlim = c(0,2000), col = "blue", main = "Blogs", ylab = "Frecuency", xlab = "Lines Lenght")

abline(v = mean(lenblogs),
       col = "black",
       lwd = 2)

abline(v = median(lenblogs),
       col = "yellow",
       lwd = 2)

hist(lennews, breaks = 100, xlim = c(0,1500), col = "red", main = "News", ylab = NULL, xlab = "Lines Lenght")

abline(v = mean(lennews),
       col = "black",
       lwd = 2)

abline(v = median(lennews),
       col = "yellow",
       lwd = 2)

hist(lentwit, col = "green", main = "Twitter", xlab = "Lines Length", ylab = NULL)

abline(v = mean(lentwit),
       col = "black",
       lwd = 2)

abline(v = median(lentwit),
       col = "yellow",
       lwd = 2)

# Showing the summary of the data set 
summary(lenblogs)
summary(lennews)
summary(lentwit)

# Counting the words in each file
Words_blogs<- sapply(gregexpr("\\W+", blogs), length) + 1
Words_news<- sapply(gregexpr("\\W+", news), length) + 1
Words_twit<- sapply(gregexpr("\\W+", twit), length) + 1

sum(Words_blogs)
sum(Words_news)
sum(Words_twit)

# Getting the no letter symbols in each file
SymBlogs <- unique(na.omit(unlist(strsplit(unlist(blogs), "[!^a-zA-Z]+"))))
SymNews <- unique(na.omit(unlist(strsplit(unlist(news), "[!^a-zA-Z]+"))))
SymTwit <- unique(na.omit(unlist(strsplit(unlist(twit), "[!^a-zA-Z]+"))))

# Counting the total different symbols of each file 
length(SymBlogs)
length(SymNews)
length(SymTwit)
