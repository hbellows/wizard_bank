require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank'
require './lib/person'

class BankTest < Minitest::Test

  def test_a_bank_is_created_with_a_name
    skip
    bank = Bank.new('The Golden Galleon')

    assert_equal 'The Golden Galleon', bank.bank_name
  end

  def test_a_new_account_starts_with_a_zero_balance
    skip
    bank = Bank.new('The Golden Galleon')
    person = Person.new('Hermione', 1500)

    bank.open_account(person)
    assert_equal 0, person.accounts[bank.bank_name]
  end

  def test_it_can_accept_a_deposit_and_adjust_cash_level
    skip
    bank = Bank.new('The Silver Sickle')
    person = Person.new('Hermione', 1500)

    bank.open_account(person)
    bank.deposit(person, 150)

    assert_equal 150, person.accounts[bank.bank_name]
    assert_equal 1350, person.cash
  end

  def test_a_deposit_cannot_exceed_cash_level
    skip
    bank = Bank.new('The Bronze Knut')
    person = Person.new('Harry', 500)

    bank.open_account(person)

    result = "Harry does not have enough cash to perfom this deposit."

    assert_equal result, bank.deposit(person, 1500)
    end

    def test_it_can_process_a_withdrawl_and_adjust_cash_level
      skip
      bank = Bank.new('The Silver Sickle')
      person = Person.new('Hermione', 1500)

      bank.open_account(person)
      bank.deposit(person, 500)
      assert_equal 500, person.accounts[bank.bank_name]

      bank.withdrawl(person, 100)
      assert_equal 400, person.accounts[bank.bank_name]
      assert_equal 1100, person.cash
    end

    def test_it_can_check_cash_level_against_deposit_amt
      skip
      bank = Bank.new('The Golden Galleon')
      person = Person.new('Jenny', 1500)

      bank.open_account(person)
      bank.deposit(person, 500)
      assert_equal 500, person.accounts[bank.bank_name]

      result = "Insufficient funds."
      assert_equal result, bank.withdrawl(person, 1000)
    end

    def test_it_can_transfer_funds_between_banks
      skip
      bank_1 = Bank.new('The Silver Sickle')
      bank_2 = Bank.new('The Bronze Knut')
      person = Person.new('Luna', 1000)

      bank_1.open_account(person)
      bank_1.deposit(person, 500)
      assert_equal 500, person.accounts[bank_1.bank_name]

      bank_2.open_account(person)
      assert_equal 0, person.accounts[bank_2.bank_name]

      bank_1.transfer(person, bank_2, 200)

      assert_equal 200, person.accounts[bank_2.bank_name]
      assert_equal 300, person.accounts[bank_1.bank_name]
      assert_equal 500, person.cash
    end

    def test_it_can_check_availability_of_funds
      skip
      bank_1 = Bank.new('The Bronze Knut')
      bank_2 = Bank.new('The Golden Galleon')
      person = Person.new('Ron', 1000)

      bank_1.open_account(person)
      bank_1.deposit(person, 500)
      assert_equal 500, person.accounts[bank_1.bank_name]

      bank_2.open_account(person)
      assert_equal 0, person.accounts[bank_2.bank_name]

      result = "Insufficient funds."
      assert_equal result, bank_1.transfer(person, bank_2, 1000)
    end

    def test_it_can_halt_transfers_to_unopened_accounts
      bank_1 = Bank.new('The Silver Sickle')
      bank_2 = Bank.new('The Bronze Knut')
      person = Person.new('Hagrid', 2000)

      bank_1.open_account(person)
      bank_1.deposit(person, 1000)
      assert_equal 1000, person.accounts[bank_1.bank_name]

      result = "Account not found."
      assert_equal result, bank_1.transfer(person, bank_2, 500)
    end

    def test_it_can_provide_bank_total_cash
      bank = Bank.new('Gingot\'s')
      # require "pry"; binding.pry
      person_1 = Person.new('Hermione', 500)
      person_2 = Person.new('Harry', 500)
      person_3 = Person.new('Hagrid', 1000)

      bank.open_account(person_1)
      bank.open_account(person_2)
      bank.open_account(person_3)

      bank.deposit(person_1, 250)
      bank.deposit(person_2, 250)
      bank.deposit(person_3, 500)

      assert_equal 1000, bank.total_cash
    end
end
