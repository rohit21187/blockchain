pragma solidity 0.6.2;

contract Array{
    uint256[] public numberList;
    
    function addNumberToList(uint256 _newnumber) public{
        numberList.push(_newnumber);
        
    }
}