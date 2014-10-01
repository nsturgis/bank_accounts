require "csv"
require "pry"
#####################
#   cvs's => hash
#####################
balances = []
CSV.foreach("balances.csv",headers:true,header_converters: :symbol, converters: :numeric) do |row|
  balances << row.to_hash
end

exchanges = []
CSV.foreach("bank_data.csv",headers:true,header_converters: :symbol, converters: :numeric) do |row|
  exchanges << row.to_hash
end


#####################
#  dividing accounts
#####################
purchasing_account = []
exchanges.each do |row|
  if row[:account] == "Purchasing Account"
  purchasing_account << row
end
end

business_account = []
exchanges.each do |row|
  if row[:account] == "Business Account"
  business_account << row
end
end

#####################
#   calc ending bal
#####################
total_purchasing = 0
purchasing_account.each do |row|
  if row[:amount] > 0
   total_purchasing +=  row[:amount].to_f
   else
     total_purchasing - row[:amount].to_f
  end
end



#######################
#   Output
#######################

starting_balance = (balances[0][:balance].to_f).round(2)
ending_balance = (starting_balance.to_f + total_purchasing.to_f).round(2)

puts "==== #{balances[0][:account]} ===="
puts "Starting Balance: $#{starting_balance}"
puts "Ending Balance: $#{ending_balance}"
puts ''

purchasing_account.each do |row|
    puts "#{row[:amount]}  withdraw  #{row[:date]}  -  #{row[:description]}"
end
puts "======="







