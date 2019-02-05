#text analysis
library(tm)
library(rtweet)
consumerKey = 's7pyd0tktb8as7DSHBihXwJVU'
consumerSecret = 'bdfQino2TcYaEM25c6Vj6z3U2YkfGseCrfIGkTl5cL0ciMozps'
OauthToken = '1089175947163578368-46JIAhFAaAMd5NKQ2xIYYjaYhqXtKk'
OauthSecret = 'pMTbHbOL45j4IRA0GSVNijYS0Ykm8mIPTRBczUF4jDLSe'
#SETUP TWITTER CONNECTION
create_token(app = "mytwitterapp",'s7pyd0tktb8as7DSHBihXwJVU','bdfQino2TcYaEM25c6Vj6z3U2YkfGseCrfIGkTl5cL0ciMozps','1089175947163578368-46JIAhFAaAMd5NKQ2xIYYjaYhqXtKk','pMTbHbOL45j4IRA0GSVNijYS0Ykm8mIPTRBczUF4jDLSe', set_renv = TRUE)
TWEET = search_tweets("#MahindraFurio", n = 200, include_rts = FALSE)
TWEET$text
# build corpus
corpus <- Corpus(VectorSource(TWEET$text))
inspect(corpus[1:5])
#clean text
corpus <- tm_map(corpus, tolower)
inspect(corpus[1:5])
corpus <- tm_map(corpus, removePunctuation)
inspect(corpus[1:5])
corpus <- tm_map(corpus, removeNumbers)
inspect(corpus[1:5])
cleanset <- tm_map(corpus, removeWords, stopwords('english'))
inspect(cleanset[1:5])
cleanset <- tm_map(cleanset, stripWhitespace)
inspect(cleanset[1:5])
# term document matrix
tdm <- TermDocumentMatrix(cleanset)
tdm
tdm <- as.matrix(tdm)
tdm[1:10, 1:20]
distMatrix <- dist(tdm, method = 'euclidean')
head(distMatrix)
dendo <- hclust(distMatrix, method = "ward.D")
plot(dendo)
#sentiment analysis
library(syuzhet)
#read file
sentiment <- get_nrc_sentiment(TWEET$text)
# obtain sentiment scores
head(sentiment)
get_nrc_sentiment('launch')
get_nrc_sentiment('spectacular')


  ***********************************************************************************************
  ***********************************************************************************************

# network analysis
FRIENDS = get_friends("@anandmahindra", n = 5000)
FRIENDS
FRIENDS_DATA = lookup_users(FRIENDS$user_id)
FRIENDS_DATA$screen_name
FOLLOWERS = get_followers("@anandmahindra", n = 5000)
FOLLOWERS
FOLLOWERS_DATA = lookup_users(FOLLOWERS$user_id)
FOLLOWERS_DATA$screen_name
TIMELINE = get_timeline("@anandmahindra", n = 100)
head(TIMELINE$text)
FAVORITES = get_favorites("@anandmahindra",n = 3000)
FAVORITES$screen_name
RETWEETER = get_retweeters(status_id = "1087849748915257344", n = 100)
RETWEETER
RETWEETER_DATA = lookup_users(RETWEETER$user_id)
RETWEETER_DATA$screen_name
# location analysis
FRIENDS = get_friends("@anandmahindra", n = 5000)
FRIENDS
FRIENDS_DATA = lookup_users(FRIENDS$user_id)
FRIENDS_DATA$location
FOLLOWERS = get_followers("@anandmahindra", n = 5000)
FOLLOWERS
FOLLOWERS_DATA = lookup_users(FOLLOWERS$user_id)
FOLLOWERS_DATA$location
TIMELINE = get_timeline("@anandmahindra", n = 100)
TIMELINE$location
TWEET = search_tweets("#MahindraFurio", n = 200, include_rts = FALSE)
TWEET$location
RETWEETER = get_retweeters(status_id = "1087849748915257344", n = 100)
RETWEETER
RETWEETER_DATA = lookup_users(RETWEETER$user_id)
RETWEETER_DATA$location
FAVORITES = get_favorites("@anandmahindra",n = 3000)
FAVORITES$location
RETWEET = get_retweets(status_id = "1087849748915257344", n = 100)
RETWEET$location
#action analysis
TWEET = search_tweets("#MahindraFurio", n = 200, include_rts = FALSE)
TWEET$text
TWEET_DATA = lookup_users(TWEET$user_id)
head(TWEET_DATA$screen_name)
USER = users_data(TWEET)
USER
PLOT = ts_plot(TWEET)
PLOT
RETWEET = get_retweets(status_id = "1087849748915257344", n = 100)
RETWEET$text


