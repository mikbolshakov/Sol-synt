// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Demo {
  string public name = "Michael";
  uint public age = 30;
  mapping (address => uint) public payments;

  
  function getName() public view returns(string memory) {
    return name;
  }

  function setData(string calldata _newName, uint _newAge) public {
    name = _newName;
    age = _newAge;
  }

  function receiveMoney(address _payer) external payable {
    payments[_payer] = msg.value;
  }


  fallback() external payable {
    payments[msg.sender] = msg.value;
  }

  receive() external payable {}
}