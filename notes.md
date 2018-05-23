Default currency = Galleon

1 Galleon = 17 Sickles (or 493 Knuts)
1 Sickle = 29 Knuts

Person class = name, initial cash amount
  the person class should indicate the banks with which each person has an account, and balances at those banks

Bank class should have a method that allows the creation of an account   that is attached to a person (chase.open_account(person_1))

Banks accept deposits by passing in a person and amount via a deposit method. The person's balance will increase by the deposit amount (chase.deposit(person_1, amt)).  Each person has an account balance and a cash balance. A deposit cannot exceed current cash level
