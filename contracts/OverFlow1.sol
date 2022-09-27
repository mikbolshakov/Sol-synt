// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.8.0;

contract Overflow {
  uint8 public crit = type(uint8).max;

  function increment() public {
    crit++;
  }
  
  function decrement() public {
      crit--;
  }
}