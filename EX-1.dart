// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';

import 'EX-2.dart';

enum Skill { FLUTTER, DART, OTHER }

class Address {
  // Q3 - Make all attributes private and provide getter methods for accessing them.
  String _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

// Q1- Add the following new attributes to the Employee class:
class Employee {
  String _name;
  double _baseSalary;
  // • skills: A list of skills
  List<Skill> _skills;
  // • address: An Address class that contains street, city, and zipCode attributes
  Address _address;
  // • yearsOfExperience: An integer representing the employee's experience in years
  int _yearsOfExperience;
  // Q2 - Update the constructor to initialize the new attributes.
  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  // Add named constructors for specific types of employees
  // Example: mobileDeveloper constructor that assigns FLUTTER and DART skills
  Employee.MobileDeveloper(
    this._name,
    this._baseSalary,
    this._address,
    this._yearsOfExperience, {
    this._skills = const [Skill.DART, Skill.FLUTTER],
  });

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearOfExperience => _yearsOfExperience;

  // Add a method to compute the salary of the employee (you can create your own rules!):
  // Salary Specification:
  // Base salary: $40,000.
  // Each year of experience adds $2,000.
  // Each skill adds a different bonus:
  // • FLUTTER: $5,000.
  // • DART: $3,000.
  // • OTHER: $1,000.
  void computeSalary() {
    //initialize bonus
    double bonuses = 0;

    //loop through all skills and add to bonus
    for (var skill in skills) {
      switch (skill) {
        case Skill.FLUTTER:
          // TODO: Handle this case.
          bonuses += 5000;
        case Skill.DART:
          // TODO: Handle this case.
          bonuses += 3000;
        case Skill.OTHER:
          // TODO: Handle this case.
          bonuses += 1000;
      }
    }
    // adding up total salary including base salary experiences and bonuses
    double total_salary =
        this.baseSalary + this.yearOfExperience * 2000 + bonuses;

    print("Total salary is \$${total_salary}");
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
  }
}

// Add named constructors for specific types of employees
// Example: mobileDeveloper constructor that assigns FLUTTER and DART skills
void main() {
  Employee emp1 = Employee(
    'Sokea',
    40000,
    [Skill.DART, Skill.FLUTTER],
    Address("Street 2004", "PhnomPenh", "2006"),
    3,
  );
  emp1.printDetails();

  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();

  emp1.computeSalary();
}
