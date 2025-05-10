// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// supporting only two users for now 

contract EthSplitter {
    address payable public user1;
    address payable public user2;

    constructor(address payable _user1, address payable _user2) {
        user1 = _user1;
        user2 = _user2;
    }

    receive() external payable {
        uint256 half = msg.value / 2;
        user1.transfer(half);
        user2.transfer(msg.value - half);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
