class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    @@all = []
    def initialize(name, balance = 1000)
        @name = name
        @balance = balance
        @status = "open"
        @@all << self
    end

    def deposit(dep_amount)
        self.balance += dep_amount 
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end
    
    def valid?
        self.status == "open" && self.balance > 0 ? true : false
    end

    def close_account
        self.status = "closed"
    end
    
    def self.all
        @@all
    end
end
