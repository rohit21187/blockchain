pragma solidity ^0.6.2;

contract Storage{
    uint256 public rollNo;
    
    function setnumber(uint256 _newnumber) public {
        rollNo = _newnumber;
    }
}