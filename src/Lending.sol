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

    modifier onlyborrower(){
        require(msg.sender==borrower,"Only borrower can call this function");
        _;
    }

    function transferownershipback(address _borrower) public onlyowner{
        borrower=_borrower;
    }

    function returnasset() public onlyborrower{
        require(block.timestamp>=returntime,"Return time not reached yet");
        require(!returned,"Asset already returned");
        uint interest=(amount*interestrate*(block.timestamp-returntime))/(100*365 days);
        uint totalamt=amount+interest;
        payable(owner).transfer(totalamt);
    }

    receive() external payable {}
}
