//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

/*
Declare a function called concatenate that takes two strings as parameters and returns them concatenated
Note: Since Solidity does not offer a native way to concatenate strings use abi.encodePacked() to do that
Once you are done, run npx hardhat test to check your work :D
*/

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;
    mapping(address => uint) balances;

    constructor() {
        owner = msg.sender;
    }

    receive () external payable {
        require(msg.value > 0);
        balances[address(this)] += msg.value;
    }

   function getBalance () external view returns (uint){ 
        return balances[address(this)];
    }

    function transferAll(address payable payee) public {
        require(msg.sender == owner, "ONLY_OWNER");
        payee.transfer(balances[address(this)]);
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate (string calldata s1, string calldata s2) public pure returns (string memory) {
        return string(abi.encodePacked(s1, s2));
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }
}
