pragma solidity 0.6.2;
contract Lottery {
    struct Entry {
        address player;
        string name;
        uint256 amount;
    }
    
    Entry[] public entries;
    
    function enterLottery(string memory _name) public payable {
        require(msg.value >=0.5 ether, 'lesss amount sent');
        
        entries.push(Entry({
            player: msg.sender,
            name: _name,
            amount: msg.value
        }));
    }
    
    function generateRandom(uint256 _seed) public view returns(uint256) {
        return uint(keccak256(abi.encodePacked(now,_seed,entries.length)))%entries.length;
        
    }
    /*function seeWhatNowIs() public view returns(uint256){
        return now;
    }*/
    function endLottery() public {
        uint256 _winnerAmount = address(this).balance/5;
         
        for(uint256 i=1;i<6;i++){
        uint256 _winnerIndex = generateRandom(i);
        address _winnerAddress = entries[_winnerIndex].player;
        payable(_winnerAddress).transfer(_winnerAmount);
     }}
}