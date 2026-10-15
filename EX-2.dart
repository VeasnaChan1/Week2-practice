// Q1 - Decide which attributes make sense for a bank account
import 'dart:mirrors';

class BankAccount {
  // TODO
  late String _name;
  late double _balance;
  late int _accountId;

  BankAccount(this._name, this._accountId, {this._balance = 0});

  BankAccount.withBalance(int accountId, String name, double balance) {
    this._accountId = accountId;
    this._name = name;
    this._balance = balance;
  }

  //     Q2 – Implement the following methods
  // balance(): -
  // Returns the current balance
  double balance() => _balance;

  //   withdraw(double amount) - -
  // Deducts the given amount from the account balance.
  // If the balance goes below 0, it should throw an exception.
  void withdraw(double amount) {
    if (this._balance - amount >= 0) {
      this._balance -= amount;
    } else {
      throw Exception("Insufficient balance for withdrawal!");
    }
  }

  //   credit(double amount) -
  // Bank
  // Adds the given amount to the account balance.

  void credit(double amount) {
    this._balance += amount;
  }
}

class Bank {
  //   Q3 - Decide which attributes make sense for a bank  -
  // The Bank class manages a list of accounts and ensures the uniqueness of each account ID.
  // TODO
  String _name;
  List<BankAccount> _accounts = [];

  Bank({required this._name});

  //     Q4 – Implement the following method
  // Account createAccount(int accountId, String accountOwner) - - -
  // Create a new bank account
  // Ensure that the account ID is unique. Otherwise, throw an exception
  // Add the account to the bank list and return it

  BankAccount createAccount(int accountId, String accountOwner) {
    //check if the id is unique

    for (var account in _accounts) {
      if (accountId == account._accountId) {
        throw Exception("Account with ID ${accountId} already exists!");
      }
    }

    BankAccount newAccount = BankAccount(accountOwner, accountId);
    this._accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(" Balance : \$${ronanAccount.balance()}"); // Balance: $0
  ronanAccount.credit(100);
  print(" Balance : \$${ronanAccount.balance()}"); // Balance: $100
  ronanAccount.withdraw(50);
  print(" Balance : \$${ronanAccount.balance()}"); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
