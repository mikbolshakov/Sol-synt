// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Immutable {
    address public cons = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public constant con = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
    address public immutable imm; 

    constructor(address _newImm) {
        imm = _newImm;
    }

    function immut() public view returns(uint) {
        require(msg.sender == imm, "Error!") ;
        return 42; 
    }
}