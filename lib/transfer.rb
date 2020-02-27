require 'pry'

class Transfer
  
  @@last_transfer = []

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    # binding.pry
    if self.status = "pending" && self.sender.balance > self.amount && self.valid? && @@last_transfer.last != self
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      @@last_transfer << self
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      #WHY DOES 29 have to be above 30???!?!?!?!?
    end
  end

  def reverse_transfer
    # binding.pry
    if @@last_transfer.last.status = "complete"
      @@last_transfer.last.sender.balance += @@last_transfer.last.amount
      @@last_transfer.last.receiver.balance -= @@last_transfer.last.amount
      @@last_transfer.last.status = "reversed"
    end

  end
  
end
