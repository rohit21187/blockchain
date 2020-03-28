pragma solidity 0.6.2;

contract Registration{
    struct StudentReg{
        string name;
        uint256 roolNo;
        
    }
    
    StudentReg[] public registrations;
    
    function newregistration(
        string memory _newName,
        uint256 _newRollNo
        ) public {
            registrations.push(
                StudentReg({
                name: _newName,
                roolNo: _newRollNo
            })
        );
    }
 function getNumberOfRegistration()public view returns (uint256){
     return registrations.length;
 } 
}