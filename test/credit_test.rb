require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit'
require './lib/person'

class CreditTest < Minitest::Test

  def test_it_can_open_a_line_of_credit
    amex = Credit.new('AMEX')
    person = Person.new('Luna', 2000)

    amex.open_credit(person, 1000, 0.05)

    assert_equal 'Luna', amex.account_holders.keys.join
    assert_equal 1000, amex.account_holders[person.name][:balance]
    assert_equal 0.05, amex.account_holders[person.name][:apr]
  end

  def test_it_can_track_spending
    citi = Credit.new('Citi')
    person = Person.new('Hermione', 2500)

    citi.open_credit(person, 1000, 0.05)
    require "pry"; binding.pry

    assert_equal 100, citi.cc_spend(person, 100)
  end

end


# There should be a Credit class, and each Credit should have a unique name. amex = Credit.new("AMEX")
# When you open a line of credit, you pass it a person, a credit limit and an interest rate. amex.open_credit(person1, 100, 0.05)
# A person should be able to spend against your credit limit. amex.cc_spend(person1, 50)
# A person should not be able to spend more than their credit limit.
# A person should be able to pay down their credit balance.
# A person should not be able to pay down their credit balance with more than their cash on hand.
