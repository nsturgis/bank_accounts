require "csv"
require "pry"
require_relative 'account'
require_relative 'transaction'



business_checking = Account.new('Business Checking')
personal_checking = Account.new('Purchasing Account')
puts business_checking.display
puts ''
puts personal_checking.display








#################################
#         output
#################################

# ==== Purchasing Account ====
# Starting Balance: $201.94
# Ending Balance:   $637.09

# $29.99   WITHDRAWAL  09/12/2013 - Amazon.com
# $500.33  DEPOSIT     09/14/2013 - Sales Deposit
# $35.19   WITHDRAWAL  09/15/2013 - Staples.com
# ========

# ==== Business Checking ====
# Starting Balance: $594.19
# Ending Balance:   $923.94

# $60.19   WITHDRAWAL  09/12/2013 - Pizza Pizza
# $400.20  WITHDRAWAL  09/14/2013 - Payroll
# $790.14  DEPOSIT     09/15/2013 - Sales Deposit
# ========


# acc = []
# CSV.foreach("balances.csv",headers:true,header_converters: :symbol, converters: :numeric) do |row|
#   acc << row.to_hash
# end


# poop = []
# acc.each do |account|
#   poop << Account.new(account)
# end
# binding.pry
