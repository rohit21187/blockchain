pragma solidity 0.6.2;

contract Lottery {
struct Entry {
address player;
string name;
uint256 amount;
}

Entry[] public entries;
uint256 public endTime;

function enterLottery(string memory _name) public payable {
require(msg.value >= 0.5 ether, 'not sent enough entry amount');

if(entries.length == 0) {
endTime = now + 5 minutes;
}

entries.push(Entry({
player: msg.sender,
name: _name,
amount: msg.value
}));
}

function generateRandom(uint256 _seed) public view returns (uint256) {
return uint256(keccak256(abi.encodePacked(now, _seed, entries.length))) % entries.length;
}

function endLottery() public {
require(endTime <= now, 'cannot end lottery before end time');

uint256 _winningAmount = address(this).balance / 5;

for(uint256 i = 1; i <= 5; i++) {
uint256 _winnerIndex = generateRandom(i);
address _winnerAddress = entries[_winnerIndex].player;
payable(_winnerAddress).transfer(_winningAmount);
}

while(entries.length > 0) {
entries.pop();
}
}


}