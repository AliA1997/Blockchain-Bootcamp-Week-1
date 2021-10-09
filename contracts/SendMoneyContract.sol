pragma solidity ^0.8.1;

//In the javascript vm accounts or wallets. 
//THe funds from the wallet are sent to the smart contract in the blockchain. 
//That is why a wallet loses money  becuase the amount of ether or wei they send as a value in a form of a msg object during a transaction is removed from that wallet.
//Now if we want pay another wallet from the smart contract we would use or lose those funds that we received from another wallet or account and send it to that wallet. In this case we would  send it to the msg's object sender property.
//Therefore we would pay transaction fees(gas fees) since are doing a transaction from that account.
//In cases when you pass a address to send money to,and you are using a different wallet then that address and you sending funds from the smart contract. 
//THe address receiving the funds if it is not initiating the transaction IT WILL NOT PAY THE GAS FEES


contract SendMoneyContract {
    uint public balanceReceived = 0;
    //How long the smart contract has been locked.
    uint public lockedUntil;
    //msg is 
    function receiveMoney() public payable {
        balanceReceived += msg.value;
        //This will block the smart contract for one minute when it receives money
        lockedUntil = block.timestamp + 1 minutes;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    //This functions are insecure by the way.
    function withdrawMoney() public {
        //If the lockedUntil is less than the current time(based on the block.timestamp global object property)
        if(lockedUntil < block.timestamp) {
            address payable to = payable(msg.sender);
            to.transfer(getBalance());
        }
    }
    
    function withdrawMoneyTo(address payable _to) public {
        //If the lockedUntil is less than the current time(based on the block.timestmap global object property)
        if(lockedUntil < block.timestamp) {
            _to.transfer(getBalance());
        }
    }
    
}
