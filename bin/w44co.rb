#!/usr/bin/env ruby
require 'rubygems'
require 'chatterbot/dsl'
puts "Loading echoes_bot.rb"
exclude "http://"
blacklist "mean_user, private_user"

client.search("twitter").take(5).each { |tweet| retweet(tweet[:id]) }
  
update_config
