// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* списываем eth со своего адреса на контракт Facilitator (посредник)
Далее Facilitator отправляет их на адрес Demo */

contract Facilitator {
  function withdrawMoney(address _demoAddr) public payable {
    Demo(_demoAddr).receiveMoney{value: msg.value}();
  }
}

contract Demo {
  mapping (address => uint) public payments;

  function receiveMoney() public payable {
    payments[msg.sender] = msg.value;
  }
}