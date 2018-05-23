require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'
require './lib/bank'

class PersonTest < Minitest::Test

  def test_it_has_attributes
    person = Person.new('Minerva', 1000)

    assert_equal 'Minerva', person.name
    assert_equal 1000, person.cash
  end

  def test_it_can_create_a_new_person
    person = Person.new('Luna', 500)

    assert_equal 'Luna', person.name
    assert_equal 500, person.cash
  end

  def test_it_can_store_new_bank_accounts
    person = Person.new('Luna', 500)
    bank = Bank.new('The Golden Galleon')
    result = {'The Golden Galleon' => 0}

    bank.open_account(person)
    assert_equal 0, person.accounts[bank.name]
    assert_equal result, person.accounts
  end

  def test_it_can_store_bank_deposits
    person = Person.new('Luna', 500)
    bank = Bank.new('The Golden Galleon')
    result = {'The Golden Galleon' => 50}

    bank.deposit(person)
    assert_equal 50, person.accounts[bank.name]
    assert_equal result, person.accounts
  end

end
