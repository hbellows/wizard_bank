require './lib/person'

class Credit
  attr_reader :name, :account_holders

  def initialize(name)
    @name = name
    @account_holders = {}
  end

  def open_credit(person, loan_amt, interest)
    @account_holders[person.name] = {balance: loan_amt, apr: interest}
  end

  def cc_spend(person, spend_amt)
    #interest = (spend_amt * interest)
    #balance = (loan_amt - spend_amt) + interest
  end

end


#IN PROGRESS
# When you open a line of credit, you pass it a person, a credit limit and an interest rate. amex.open_credit(person1, 100, 0.05)
# A person should be able to spend against your credit limit. amex.cc_spend(person1, 50)
# A person should not be able to spend more than their credit limit.
# A person should be able to pay down their credit balance.
# A person should not be able to pay down their credit balance with more than their cash on hand.


# COMPLETED
# There should be a Credit class, and each Credit should have a unique name. amex = Credit.new("AMEX")
