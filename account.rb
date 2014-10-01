require_relative 'transaction'
require 'pry'

class Account
  attr_accessor :account_name, :starting_balance, :ending_balance

  def initialize(account_name)
    @account_name = account_name
    @starting_balance = make_start(account_name)
    @transactions = get_trans(account_name)
    @ending_balance = calc_ending_balance

  end

  def make_start(account_name)
    CSV.foreach('balances.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      if row[:account] == account_name
        return row[:balance].to_f
      end
    end
    puts "invalid entry"
    nil
  end

  def get_trans(account_name)
    trannys = []
    CSV.foreach('bank_data.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      if row[:account] == account_name
        trannys << Transaction.new(row[:date], row[:amount], row[:description])
      end
    end
    trannys
  end

  def calc_ending_balance
    bill = starting_balance
    transactions.each do |transaction|
      bill += transaction.amount
    end
    bill.to_f
  end

  def summary
    bills = []
    transactions.each do |transaction|
      bills << transaction.summary
    end
    bills
  end

  def display
      puts "==== #{account_name} ===="
    puts "Starting Balance: $#{starting_balance}"
    puts "Ending Balance: $#{ending_balance}"
    puts ''
    summary.each do |sum|
       sum
    end
  end



  private

  attr_accessor :transactions
end
