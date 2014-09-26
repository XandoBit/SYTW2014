#archivo twitter.rb

require 'twitter'
require './configure'

screen_name = ARGV[0] || 'timoreilly'
a_user = Twitter.user(screen_name)

puts <<"EOS"
NombreUsuario : #{a_user.screen_name}
Nombre : #{a_user.name}
Followers : #{a_user.followers_count}
Amigos : #{a_user.friends_count}
Verified : #{a_user.verified}
EOS

tweet = Twitter.user_timeline(screen_name).first

if tweet
  puts "Id del tweet : #{tweet.id}"
  puts "Texto : #{tweet.text }"
  puts "Hora del tweet : #{tweet.created_at}"
  
end