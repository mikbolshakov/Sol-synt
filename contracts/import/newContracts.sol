// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* Контракт Person - персона, у которой есть адрес _owner, который мы задаем,
и factory, кто является создателем персоны
Контракт PersonFactory порождает новые контракты, на вход принимает адрес, который
будет владельцем нового контракта Person. При создании в новый контракт автоматически 
перечисляем половину баланса. */

contract Person {
  address public factory;
  address public owner;

  constructor(address _owner) payable {
    owner = _owner;
    factory = msg.sender;
  }
}

contract PersonFactory {
  Person[] public persons;

  // функция для принятия денежных средств
  function deposit() public payable {} 

  function thisBalance() public view returns(uint) {
    return address(this).balance;
  }

  // создает новый контракт Person, переводит ему деньги и пушит в массив
  function createPerson(address _owner) public {
    Person newPerson = new Person{value: thisBalance() / 2}(_owner);
    persons.push(newPerson);
  }

  // возвращает адрес создателя нового контракта Person
  function getFactory(uint _index) public view returns(address) {
    return persons[_index].factory();
  }

  function balanceOf(uint _index) public view returns(uint) {
    return address(persons[_index]).balance;
  }
}