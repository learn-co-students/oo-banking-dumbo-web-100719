class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    return self.sender.valid? && self.receiver.valid? && self.sender.balance > self.amount
  end

  def execute_transaction
    if self.valid? && self.status != 'complete'
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = 'reversed'
    end
  end

end
