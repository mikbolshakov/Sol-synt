// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MathCardio {    
  uint public x = 2;
  uint public y = 3;
    uint public sum = x + y;
    uint public power = sum ** x;
    uint public modulo = power % y;
} 