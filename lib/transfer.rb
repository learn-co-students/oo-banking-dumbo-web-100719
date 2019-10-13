class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @all = []

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    transfer_count = 0

    # while transfer_count = 0 do 
      if receiver.status == "closed" 
        self.status = "rejected"
        transfer_count += 1
        p "Transaction rejected. Please check your account balance."
        # break if transfer_count > 0
      elsif receiver.balance < amount 
        self.status = "rejected"
        transfer_count += 1
        p "Transaction rejected. Please check your account balance."
        # break if transfer_count > 0
      else
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
        transfer_count += 1
        # break if transfer_count > 0
      end
    # end
  end

  def reverse_transfer
  end

  def self.all
    @@all
  end
end
