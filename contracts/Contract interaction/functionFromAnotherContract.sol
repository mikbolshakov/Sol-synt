// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* В контракте Facilitator вызываем функцию callSetName, которая вызывает
функцию setName из контракта Demo и присваивает name новое значение Mike */

contract Facilitator {
  function callSetName(address _demoAddr) public {
    Demo(_demoAddr).setName("Mike")
  } // _demoAddr - адрес контракта Demo
}

contract Demo {
  string public name = "Michael";

  function setName(string calldata _newName) external {
    name = _newName;
  }
}