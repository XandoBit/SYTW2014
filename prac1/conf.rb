#archivo configuracion

require 'twitter'
require './configure'

name	= ARGV[0]
user = Hash.new
three 	= Twitter.friend_ids(name)

three.ids[0..3].each do |a|
  f = Twitter.user(a)
  if (f.protected.to_s != "true")
    user[f.screen_name.to_s] = f.followers_count
  end
end

user.sort_by {|k,v| -v}.each{|x, y| puts "#{x} => #{y}"}
