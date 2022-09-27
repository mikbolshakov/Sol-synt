// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract Object {
    uint public sum;
    address public sender;
    uint public timestamp;
    uint public number;
    uint public limit;
    uint public price;
    address public contractAddress;
    uint public balance;

    function object() public payable {
        sum = msg.value;
        sender = msg.sender;
        timestamp = block.timestamp;
        number = block.number;
        limit = block.gaslimit;
        price = tx.gasprice;
        contractAddress = address(this);
        balance = contractAddress.balance;
    }
}