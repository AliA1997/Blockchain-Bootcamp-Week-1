pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    //Best practice to hold variable who owns smart contract
    address owner;
    
    bool public paused = false;
    //Called once during contract deployment
    constructor() public {
        //The eoa(externally owned account) that deploys smart contract
        owner = msg.sender;
    }
    
    function sendMoney() public payable {
        
    }
    //One account tells smart contract account or smart contract to send to another contract
    //You should pass control who owns smart contract to destroy or send funds
    function withdrawAllMoney(address payable _to) public {
        //If statements DONT work in solidity use require statements instead
        //It will throw a exception therefore it won't exist on blockchain.
        //require(condition, exception message)
        require(msg.sender == owner, "You are not authorized");
        require(!paused, "Contract is paused");
        _to.transfer(address(this).balance);
    }
    
    //How to pause a smart contract
    //Can use a boolean variable to indicate if contract is paysed.
    //Create a function that setPaused.
    //Only have the owner pause the smart contract
    //Whenever funds are being withdrawn check if the contract is paused.
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not authorized");
        paused = _paused;
    }
    
    //How would to destroy a smart contract, give a addres to send all funds from smart ccontract
    //selfdestruct function that takes  a address that takes all the funds from the smart contract.
    //Only the owner should destroy smart contract
    //After the smart contract is destroy any functions that are initiated are canceled by a 
    //error: Failed to decode output: TypeError: Can not read property length of undefined.
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner , "You are not authorized");
        selfdestruct(_to);
    }

}