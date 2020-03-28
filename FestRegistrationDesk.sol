pragma solidity 0.6.2;

contract FestRegistrationDesk {
    struct StudentReg{
        address WalletAdress;
        string name;
        uint256 amount;
    }
    
    address public financeManager;
    StudentReg[] public registrations;
    
    constructor() public {
        financeManager = msg.sender;
    }
    
    function newRegistration(
        string memory _name
        ) public payable{
            require(msg.value >=1 ether,'not enough sent');
            
            registrations.push(StudentReg({
                WalletAdress: msg.sender,
                name: _name,
                amount: msg.value
            }));
        }
    
    function grtBalanceOfContract() public view returns(uint256){
        return address(this).balance;
    }  
    
    function withdrawFunds() public {
        require (msg.sender == financeManager, 'only finance manager allowed');
        payable(financeManager).transfer(grtBalanceOfContract());
        
    }
    
}