// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract FundsDemo {
    uint public balanceReceived;
    uint public balanceToRec;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function someMoney(uint _sendMoney) public {
        balanceToRec = _sendMoney;
    }

    function withdrawMoney() public {
        address payable receiver = payable(msg.sender);
        receiver.transfer(balanceToRec);
    }
}


