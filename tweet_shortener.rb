def dictionary(word)
  replacements = {
    ["hello"] => "hi",
    ["to", "two", "too"] => "2",
    ["for", "four"] => "4",
    ["be"] => "b",
    ["you"] => "u",
    ["at"] => "@",
    ["and"] => "&"
  }
  l_word = word.downcase
  if replacements.keys.flatten.include?(l_word)
    replacements.each do |key, value|
      if key.include?(l_word)
        return value
      end
    end
  else
    return nil
  end
end


def word_substituter(tweet)
  tweet_array = tweet.split(" ")
  subbed_tweet_array = []
  tweet_array.each do |word|
    temp_word = dictionary(word)
    if temp_word != nil
      subbed_tweet_array.push(temp_word)
    else
      subbed_tweet_array.push(word)
    end
  end
  new_tweet = subbed_tweet_array.join(" ")
  new_tweet
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    new_tweet = word_substituter(tweet)
    puts new_tweet
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  subbed_tweet = selective_tweet_shortener(tweet)
  if subbed_tweet.length > 140
    subbed_tweet.slice(0...140)
  else
    subbed_tweet
  end
end