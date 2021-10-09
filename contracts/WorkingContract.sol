pragma solidity ^0.8.9;

contract WorkingContract {
    uint256 public myUint;
    bool public myBool;
    uint8 public myUintBug;
    address public myAddress;
    string public myString;
       
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    function incrementUint8() public {
        //unchecked {
            myUintBug++;
        //}
    }
    
    function decrementUint8() public {
        //unchecked {
            myUintBug--;
       //}
    }
    
    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }
    
    function returnCurrentBalance() public view returns(uint) {
        return myAddress.balance;
    }
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}