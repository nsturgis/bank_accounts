class Transaction
  attr_reader :date, :amount, :description

  def initialize(date, amount, description)
    @date = date
    @amount = amount
    @description = description
  end

  def deposit?
    amount > 0
  end

  def deposit_type
    deposit? ? "DEPOSIT\t" : "WITHDRAW"
  end

  def summary
    summary_string = "$#{sprintf("%.2f", amount.abs)}"
    summary_string += "\t" if summary_string.length < 8
    summary_string += "\t#{self.deposit_type}\t #{date}\t"
    summary_string += "#{description},"
  end

end



