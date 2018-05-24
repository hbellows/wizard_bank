class Bank
  attr_reader :bank_name, :total_cash

  def initialize(bank_name)
    @bank_name = bank_name
    @total_cash = 0
  end

  def open_account(person)
    person.accounts[bank_name] = 0
  end

  def deposit(person, amt)
    # require "pry"; binding.pry
    if person.cash < amt
       "#{person.name} does not have enough cash to perfom this deposit."
    else
      person.accounts[bank_name] += amt
      @total_cash += amt
      person.cash -= amt
    end
  end

  def withdrawl(person, amt)
    if person.accounts[bank_name] < amt
      "Insufficient funds."
    else
      person.accounts[bank_name] -= amt
      @total_cash -= amt
      person.cash += amt
    end
  end

  def transfer(person, xfer_bank, amt)
    if person.accounts[xfer_bank.bank_name] == nil
      "Account not found."
    elsif person.accounts[bank_name] < amt
      "Insufficient funds."
    else
      require "pry"; binding.pry
      withdrawl(person, amt)
      # person.accounts[bank_name] -= amt
      # @total_cash -= amt
      # person.accounts[xfer_bank.bank_name] += amt
      xfer_bank.deposit(person, amt)
    end
  end

end
