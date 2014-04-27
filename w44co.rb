#!/usr/bin/env ruby

#
# simple example of how to run a bot in a loop. if you want to do
# that, you need to call update_config to update the database at the
# end of each iteration -- this will keep you from processing the same
# tweets multiple times
#


#
# require the dsl lib to include all the methods you see below.
#
require 'rubygems'
require 'chatterbot/dsl'

puts "Loading echoes_bot.rb"

##
## If I wanted to exclude some terms from triggering this bot, I would list them here.
## For now, we'll block URLs to keep this from being a source of spam
##
exclude "http://"

blacklist "mean_user, private_user"

loop do

  puts "run search #{since_id}"
  client.search("teamfollowback", :lang => "en").take(3).collect do |tweet|
    tweet[:id]
  end

  sleep 120

  puts "run search #{since_id}"
  client.search("followback", :lang => "en").take(3).collect do |tweet|
    tweet[:id]
  end
  
  puts "checking for replies to me"
  replies do |tweet|
    src = "#USER# Whats up?? :D"  
    reply src, tweet
  end

  # explicitly update our config
  update_config

  sleep 120
end
