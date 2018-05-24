class Credit

  def initialize(name)
    @name = name
  end
end

# There should be a Credit class, and each Credit should have a unique name. amex = Credit.new("AMEX")
# When you open a line of credit, you pass it a person, a credit limit and an interest rate. amex.open_credit(person1, 100, 0.05)
# A person should be able to spend against your credit limit. amex.cc_spend(person1, 50)
# A person should not be able to spend more than their credit limit.
# A person should be able to pay down their credit balance.
# A person should not be able to pay down their credit balance with more than their cash on hand.
