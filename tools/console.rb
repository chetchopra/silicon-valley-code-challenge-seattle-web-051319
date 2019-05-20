require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Lyft", "Tom", "Transport")
s2 = Startup.new("Uber", "Jerry", "Transport")

v1 = VentureCapitalist.new("Ben", 100000)
v2 = VentureCapitalist.new("Mary", 10000000000)

# fr1 = FundingRound.new(s1, v1, "Series A", 100)
# fr2 = FundingRound.new(s2, v2, "Series B", 1000)






binding.pry
0 #leave this here to ensure binding.pry isn't the last line