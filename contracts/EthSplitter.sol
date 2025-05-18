//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract EthSplitter {
    address private receiver1 = 0x390A4E60DbFF4caf7cf3F84e04a6EC092420f20d;
    address private receiver2 = 0xf4cFCfF8d7878295b87949D2EBfE5D3e4990E97C;

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external payable{
        (bool sent1, bytes memory data1) = receiver1.call{value: address(this).balance / 2}("");
        require(sent1, "Failed to send Ether to 1");

        (bool sent2, bytes memory data2) = receiver2.call{value: address(this).balance}("");
        require(sent2, "Failed to send Ether to 2");
    }

    function distribute(address payable rec1, address payable rec2) public payable {
        // future
    }



}