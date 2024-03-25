// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lending{

    // State Variables (Class Members)
    address public owner;
    address public borrower;
    uint public amount;
    uint public returntime;
    uint public interestrate;
    bool public returned;

    constructor(uint _amount,uint _returntime,uint _interestrate){
        owner=msg.sender;
        amount=_amount;
        returntime=block.timestamp+_returntime;
        interestrate=_interestrate;
        returned=false;
    }

    modifier onlyowner(){
        require(msg.sender==owner,"Only owner can call this function");
        _;
    }
}
